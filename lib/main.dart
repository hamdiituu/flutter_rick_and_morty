import 'package:flutter/material.dart';
import './screens/main_tab/main_tab_screen.dart';

void main() => runApp(RickAndMorty());

class RickAndMorty extends StatelessWidget {
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
      home: MainTabScreen(),
    );
  }
}
