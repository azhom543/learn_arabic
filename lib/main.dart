import 'package:flutter/material.dart';
import 'package:kids_game_eslam/pages/eslam/home_eslam.dart';
import 'package:kids_game_eslam/pages/start_menu/start.dart';
import 'package:kids_game_eslam/pages/raafat/level1.dart';
import 'package:kids_game_eslam/pages/hamdy/level1.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      title: "Matching Game",
      home: StartPage(),
    );
  }
}