// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:collabverse/app.dart';
import 'package:collabverse/firebase_options.dart';
import 'package:collabverse/src/services/api/wilayah_api_service.dart';

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
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterNativeSplash.remove();

  runApp(
    MultiProvider(
      providers: [
        //* Service providers
        Provider(
          create: (_) => WilayahApiService(),
        ),
      ],
      child: CollabVerseApp(),
    ),
  );
}
