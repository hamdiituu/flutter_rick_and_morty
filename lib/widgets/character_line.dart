import 'package:flutter/material.dart';
import '../models/character.dart';
import '../models/pass_route_id.dart';

class CharacterLine extends StatelessWidget {
  Character character;
  CharacterLine({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            //Navigator.of(context).pop();
            Navigator.of(context)
                .pushNamed("/character_detail", arguments: character);
            // Navigator.of(context).popAndPushNamed(routeName);
            //Navigator.of(context).popAndPushNamed("/character_detail");

            // Navigator.pop(context);
            // Navigator.push(context, route);
            // Navigator.popAndPushNamed(context, routeName);
            // Navigator.pushNamed(context, routeName)
          },
          title: Text(
            character.name,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(character.gender),
          trailing: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundImage: NetworkImage(character.image),
              )),
          leading: Text(character.id.toString()),
        ),
        Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
