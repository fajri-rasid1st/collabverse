// main.dart
import 'package:flutter/material.dart';
import '../pages/theme.dart';
import '../pages/event_board_page.dart';

void main() {
  runApp(const CollabVerseApp());
}

class CollabVerseApp extends StatelessWidget {
  const CollabVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CollabVerse',
      theme: AppTheme.lightTheme,
      home: const EventBoardPage(),
    );
  }
}
