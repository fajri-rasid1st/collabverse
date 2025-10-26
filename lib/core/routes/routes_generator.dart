// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:collabverse/core/routes/route_names.dart';
import 'package:collabverse/src/ui/auth/pages/login_page.dart';
import 'package:collabverse/src/ui/discover/pages/discover_page.dart';

/// Routes generator
Route<dynamic>? generateAppRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Routes.discover:
      // final args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => DiscoverPage(),
      );
    case Routes.login:
      return MaterialPageRoute(
        builder: (context) => LoginPage(),
      );
    default:
      return null;
  }
}
