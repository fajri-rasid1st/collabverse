// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:collabverse/core/enums/wilayah_type.dart';
import 'package:collabverse/core/routes/route_names.dart';
import 'package:collabverse/src/data/models/wilayah/wilayah_model.dart';
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
          appBarTitle: args['appBarTitle'] as String,
          values: args['values'] as List<String>,
          initialValue: args['initialValue'] as String?,
        ),
      );
    case Routes.multipleSelectionValues:
      final args = settings.arguments as Map<String, dynamic>;

      return MaterialPageRoute(
        builder: (_) => MultipleSelectionValuesPage(
          appBarTitle: args['appBarTitle'] as String,
          values: args['values'] as List<String>,
          initialValues: args['initialValues'] as List<String>?,
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
            type: args['type'] as WilayahType,
            initialValue: args['initialValue'] as WilayahModel?,
            province: args['province'] as WilayahModel?,
          ),
        ),
      );
    default:
      return null;
  }
}
