import 'package:flutter/material.dart';
import '../models/location.dart';

class LocationLine extends StatelessWidget {
  Location location;
  LocationLine({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            location.name,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(location.dimension),
          trailing: Text(location.type),
          leading: CircleAvatar(
              child: Text(location.residents.isNotEmpty
                  ? "+" + location.residents.length.toString()
                  : "-")),
        ),
        Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
