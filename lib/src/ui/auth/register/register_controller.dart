// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterController extends ChangeNotifier {
  // Form key
  final formKey = GlobalKey<FormBuilderState>();

  // Obsecure password
  final obsecurePassword = ValueNotifier<bool>(true);

  // Obsecure confirm password
  final obsecureConfirmPassword = ValueNotifier<bool>(true);

  // Current password value
  final currentPassword = ValueNotifier<String>('');

  Future<void> register() async {
    // Validate and save the form values
    formKey.currentState?.saveAndValidate(
      autoScrollWhenFocusOnInvalid: true,
    );

    debugPrint(formKey.currentState?.value.toString());
  }
}
