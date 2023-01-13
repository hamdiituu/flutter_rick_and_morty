import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

//models
import '../../../models/info.dart';
import '../../../models/character.dart';

//widgets
import '../../../widgets/character_line.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  Info? _info;
  List<Character> _characters = [];
  String _errorMessage = "";
  bool _fetching = false;

  Future<void> getCharacters() async {
    try {
      setState(() {
        _fetching = true;
      });
      var url = Uri.https("rickandmortyapi.com", "/api/character");

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

      List<Character> responseCharacters = [];

      for (var result in jsonResponse["results"] as List) {
        Character resultCharacter = Character(
            id: result["id"],
            name: result["name"],
            status: result["status"],
            species: result["species"],
            type: result["type"],
            gender: result["gender"],
            origin: result["origin"],
            location: result["location"],
            image: result["image"],
            episode: result["episode"],
            url: result["url"],
            created: result["created"]);
        responseCharacters.add(resultCharacter);
      }

      setState(() {
        _info = responseInfo;
        _characters = responseCharacters;
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
    getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Characters"),
          actions: [
            if (_fetching)
              Container(
                margin: EdgeInsets.all(17),
                height: 20,
                width: 23,
                child: (CircularProgressIndicator(
                  color: Colors.black,
                )),
              ),
            if (!_fetching)
              (IconButton(
                icon: Icon(Icons.refresh),
                onPressed: getCharacters,
              ))
          ],
        ),
        body: _fetching
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  var character = _characters[index];
                  return CharacterLine(character: character);
                },
                itemCount: _characters.length,
              ));
  }
}
