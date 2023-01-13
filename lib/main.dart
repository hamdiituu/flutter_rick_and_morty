import 'package:flutter/material.dart';
import './screens/main_tab/main_tab_screen.dart';
import './screens/character_detail_screen.dart';
import './screens/episode_detail_screen.dart';
import './screens/location_detail_screen.dart';

void main() => runApp(const RickAndMorty());

class RickAndMorty extends StatelessWidget {
  const RickAndMorty({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      initialRoute: '/',
      routes: {
        '/': (context) => MainTabScreen(),
        '/character_detail': (context) => CharacterDetailScreen(),
        '/episode_detail': (context) => EpisodeDetailScreen(),
        '/location_detail': (context) => LocationDetailScreen()
      },
    );
  }
}
