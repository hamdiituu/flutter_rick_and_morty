import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

//models
import '../../../models/info.dart';
import '../../../models/location.dart';

//widgets
import '../../../widgets/location_line.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({Key? key}) : super(key: key);

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  Info? _info;
  List<Location> _locations = [];
  String _errorMessage = "";
  bool _fetching = false;

  Future<void> getLocations() async {
    try {
      setState(() {
        _fetching = true;
      });
      var url = Uri.https("rickandmortyapi.com", "/api/location");

      var response = await http.get(url);

      if (response.statusCode != 200) {
        throw "Service not working!";
      }

      var jsonResponse = convert.jsonDecode(response.body);

      Info responseInfo = Info(
          count: jsonResponse['info']['count'],
          pages: jsonResponse['info']['pages'],
          prev: jsonResponse['info']['prev'],
          next: jsonResponse['info']['next']);

      List<Location> responseLocations = [];

      for (var result in jsonResponse["results"] as List) {
        Location resultCharacter = Location(
            id: result["id"],
            name: result["name"],
            url: result["url"],
            created: result["created"],
            dimension: result["dimension"],
            residents:
                (result["residents"] as List).map((e) => e.toString()).toList(),
            type: result["type"]);
        responseLocations.add(resultCharacter);
      }

      setState(() {
        _info = responseInfo;
        _locations = responseLocations;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _fetching = false;
      });
    }
  }

  @override
  void initState() {
    getLocations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Locations"),
          actions: [
            if (_fetching)
              Container(
                margin: EdgeInsets.all(17),
                height: 20,
                width: 23,
                child: (CircularProgressIndicator(
                  color: Colors.white,
                )),
              ),
            if (!_fetching)
              (IconButton(
                icon: Icon(Icons.refresh),
                onPressed: getLocations,
              ))
          ],
        ),
        body: _fetching
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  var location = _locations[index];
                  return LocationLine(location: location);
                },
                itemCount: _locations.length,
              ));
  }
}
