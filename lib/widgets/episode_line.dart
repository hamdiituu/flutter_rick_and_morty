import 'package:flutter/material.dart';
import '../models/episode.dart';

class EpisodeLine extends StatelessWidget {
  Episode episode;
  EpisodeLine({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            episode.episode,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(episode.airDate),
          trailing: CircleAvatar(child: Text("+${episode.characters.length}")),
          leading: Text(episode.id.toString()),
        ),
        Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
