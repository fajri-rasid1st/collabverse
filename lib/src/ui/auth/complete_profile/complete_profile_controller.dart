// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CompleteProfileController extends ChangeNotifier {
  // Form key
  final formKey = GlobalKey<FormBuilderState>();

  /// Submit
  Future<void> submit() async {
    // Validate and save the form values
    if (formKey.currentState!.saveAndValidate(focusOnInvalid: false)) {
      debugPrint(formKey.currentState!.value.toString());

      // navigatorKey.currentState!.pushNamed(Routes.completeProfile);
    }
  }
}
