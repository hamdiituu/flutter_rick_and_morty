import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _character = ModalRoute.of(context)!.settings.arguments as Character;

    return Scaffold(appBar: AppBar(title: Text(_character.name)));
  }
}
