// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:collabverse/core/routes/route_names.dart';
import 'package:collabverse/src/shared/pages/single_selection_value_page.dart';
import 'package:collabverse/src/ui/auth/complete_profile.dart/complete_profile_controller.dart';
import 'package:collabverse/src/ui/auth/complete_profile.dart/complete_profile_page.dart';
import 'package:collabverse/src/ui/auth/login/login_controller.dart';
import 'package:collabverse/src/ui/auth/login/login_page.dart';
import 'package:collabverse/src/ui/auth/register/register_controller.dart';
import 'package:collabverse/src/ui/auth/register/register_page.dart';
import 'package:collabverse/src/ui/discover/pages/discover_page.dart';

/// Routes generator
Route<dynamic>? generateAppRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Routes.discover:
      return MaterialPageRoute(
        builder: (context) => DiscoverPage(),
      );
    case Routes.login:
      return MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider(
          create: (_) => LoginController(),
          child: LoginPage(),
        ),
      );
    case Routes.register:
      return MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider(
          create: (_) => RegisterController(),
          child: RegisterPage(),
        ),
      );
    case Routes.completeProfile:
      return MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider(
          create: (_) => CompleteProfileController(),
          child: CompleteProfilePage(),
        ),
      );
    case Routes.singleSelectionValue:
      final args = settings.arguments as Map<String, dynamic>;

      return MaterialPageRoute(
        builder: (_) => SingleSelectionValuePage(
          appBarTitle: args['appBarTitle'],
          // labels: args['labels'],
          // values: args['values'],
          // initialValue: args['initialValue'],
        ),
      );
    default:
      return null;
  }
}
