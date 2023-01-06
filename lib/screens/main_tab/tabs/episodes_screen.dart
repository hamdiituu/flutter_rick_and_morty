import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

//models
import '../../../models/info.dart';
import '../../../models/episode.dart';

//widgets
import '../../../widgets/episode_line.dart';

//event -> request -> response ->model -> use
class EpisodesScreen extends StatefulWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  Info? _info;
  List<Episode> _episodes = [];
  String _errorMessage = "";
  bool _fetching = false;

  Future<void> getEpisodes() async {
    try {
      setState(() {
        _fetching = true;
      });
      var url = Uri.https("rickandmortyapi.com", "/api/episode");

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

      List<Episode> responseEpisodes = [];

      for (var result in jsonResponse["results"] as List) {
        Episode resultEpisode = Episode(
            id: result["id"],
            name: result["name"],
            airDate: result["air_date"],
            characters: result["characters"],
            episode: result["episode"],
            created: result["created"],
            url: result["url"]);
        responseEpisodes.add(resultEpisode);
      }

      setState(() {
        _info = responseInfo;
        _episodes = responseEpisodes;
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
    getEpisodes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Episodes"),
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
              onPressed: getEpisodes,
            ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ..._episodes
                .map((episode) => EpisodeLine(episode: episode))
                .toList(),
            if (_fetching)
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: (CircularProgressIndicator())))
          ],
        ),
      ),
    );
  }
}
