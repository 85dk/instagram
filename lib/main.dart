import 'package:flutter/material.dart';
import 'package:instagram/Splashscreen.dart';
import 'package:instagram/home.dart';
import 'package:instagram/page_movement.dart';
import 'package:instagram/views/homescreen.dart';
import 'package:instagram/views/messagescreen.dart';
import 'package:instagram/views/profile/reels.dart';
import 'package:instagram/views/reelscreen.dart';
import 'package:instagram/views/searchscreen.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'InstagramFont'
      ),
      home:Splashscreen(),
    );
  }
}

