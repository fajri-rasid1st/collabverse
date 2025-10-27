// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Project imports:
import 'package:collabverse/core/routes/route_names.dart';
import 'package:collabverse/core/utils/navigator_key.dart';

class LoginController extends ChangeNotifier {
  // Form key
  final formKey = GlobalKey<FormBuilderState>();

  // Obsecure password
  bool _obsecurePassword = true;

  bool get obsecurePassword => _obsecurePassword;

  set obsecurePassword(bool value) {
    _obsecurePassword = value;
    notifyListeners();
  }

  /// Login
  Future<void> login() async {
    // Validate and save the form values
    if (formKey.currentState!.saveAndValidate(focusOnInvalid: false)) {
      debugPrint(formKey.currentState!.value.toString());

      navigatorKey.currentState!.pushNamed(Routes.completeProfile);
    }
  }
}
