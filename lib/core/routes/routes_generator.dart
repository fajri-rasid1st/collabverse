// Flutter imports:
import 'package:collabverse/src/ui/event_board/event_board_detail_page.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:collabverse/core/routes/route_names.dart';
import 'package:collabverse/src/providers/api_providers/wilayah_api_provider.dart';
import 'package:collabverse/src/services/api/wilayah_api_service.dart';
import 'package:collabverse/src/shared/pages/multiple_selection_values_page.dart';
import 'package:collabverse/src/shared/pages/single_selection_value_page.dart';
import 'package:collabverse/src/shared/pages/wilayah_selection_page.dart';
import 'package:collabverse/src/ui/auth/complete_profile/complete_profile_controller.dart';
import 'package:collabverse/src/ui/auth/complete_profile/complete_profile_page.dart';
import 'package:collabverse/src/ui/auth/login/login_controller.dart';
import 'package:collabverse/src/ui/auth/login/login_page.dart';
import 'package:collabverse/src/ui/auth/register/register_controller.dart';
import 'package:collabverse/src/ui/auth/register/register_page.dart';
import 'package:collabverse/src/ui/discover/discover_page.dart';

/// Routes generator
Route<dynamic>? generateAppRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Routes.discover:
      return MaterialPageRoute(
        builder: (context) => DiscoverPage(),
      );
    case Routes.eventBoardDetail:
      final args = settings.arguments as Map<String, dynamic>;

      return MaterialPageRoute(
        builder: (context) => EventBoardDetailPage(
          event: args['event'],
        ),
      );
    case Routes.login:
      return MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider(
          create: (context) => LoginController(),
          child: LoginPage(),
        ),
      );
    case Routes.register:
      return MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider(
          create: (context) => RegisterController(),
          child: RegisterPage(),
        ),
      );
    case Routes.completeProfile:
      return MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider(
          create: (context) => CompleteProfileController(),
          child: CompleteProfilePage(),
        ),
      );
    case Routes.singleSelectionValue:
      final args = settings.arguments as Map<String, dynamic>;

      return MaterialPageRoute(
        builder: (_) => SingleSelectionValuePage(
          appBarTitle: args['appBarTitle'],
          values: args['values'],
          initialValue: args['initialValue'],
        ),
      );
    case Routes.multipleSelectionValues:
      final args = settings.arguments as Map<String, dynamic>;

      return MaterialPageRoute(
        builder: (_) => MultipleSelectionValuesPage(
          appBarTitle: args['appBarTitle'],
          values: args['values'],
          initialValues: args['initialValues'],
        ),
      );
    case Routes.wilayahSelectionValue:
      final args = settings.arguments as Map<String, dynamic>;

      return MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider(
          create: (context) => WilayahApiProvider(
            apiService: context.read<WilayahApiService>(),
          ),
          child: WilayahSelectionPage(
            type: args['type'],
            initialValue: args['initialValue'],
            province: args['province'],
          ),
        ),
      );
    default:
      return null;
  }
}
