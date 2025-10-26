// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Project imports:
import 'package:collabverse/core/utils/navigator_key.dart';

class RegisterController extends ChangeNotifier {
  // Form key
  final formKey = GlobalKey<FormBuilderState>();

  // Obsecure password
  bool _obsecurePassword = true;

  bool get obsecurePassword => _obsecurePassword;

  set obsecurePassword(bool value) {
    _obsecurePassword = value;
    notifyListeners();
  }

  // Obsecure confirm password
  bool _obsecureConfirmPassword = true;

  bool get obsecureConfirmPassword => _obsecureConfirmPassword;

  set obsecureConfirmPassword(bool value) {
    _obsecureConfirmPassword = value;
    notifyListeners();
  }

  // Current password value
  String _currentPassword = '';

  String get currentPassword => _currentPassword;

  set currentPassword(String value) {
    _currentPassword = value;
    notifyListeners();
  }

  /// Register
  Future<void> register() async {
    // Validate and save the form values
    formKey.currentState?.saveAndValidate(
      autoScrollWhenFocusOnInvalid: true,
    );

    debugPrint(formKey.currentState?.value.toString());

    navigatorKey.currentState!.pop();
  }
}
