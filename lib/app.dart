import 'package:collabverse/home_page.dart';
import 'package:flutter/material.dart';

class CollabVerseApp extends StatelessWidget {
  const CollabVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CollabVerse',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: HomePage(),
    );
  }
}
