// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../pages/theme.dart';
import '../pages/event_board_page.dart';
// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// Project imports:
import 'package:collabverse/app.dart';
import 'package:collabverse/firebase_options.dart';

void main() async {
  // Ensure widget bindings are initialized
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Prevent landscape orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterNativeSplash.remove();

  runApp(CollabVerseApp());
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
