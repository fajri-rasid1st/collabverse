// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:collabverse/core/routes/route_names.dart';
import 'package:collabverse/core/routes/routes_generator.dart';
import 'package:collabverse/core/themes/base/app_theme.dart';
import 'package:collabverse/core/utils/navigator_key.dart';

class CollabVerseApp extends StatelessWidget {
  const CollabVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CollabVerse',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      darkTheme: appTheme,
      navigatorKey: navigatorKey,
      onGenerateRoute: generateAppRoutes,
      initialRoute: Routes.discover,
    );
  }
}
