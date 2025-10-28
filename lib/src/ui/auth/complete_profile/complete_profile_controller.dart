// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Project imports:
import 'package:collabverse/src/data/models/wilayah_model.dart';

class CompleteProfileController extends ChangeNotifier {
  // Form key
  final formKey = GlobalKey<FormBuilderState>();

  // Selected province
  WilayahModel? _selectedProvince;

  WilayahModel? get selectedProvince => _selectedProvince;

  set selectedProvince(WilayahModel? value) {
    _selectedProvince = value;
    notifyListeners();
  }

  // Selected city
  WilayahModel? _selectedCity;

  WilayahModel? get selectedCity => _selectedCity;

  set selectedCity(WilayahModel? value) {
    _selectedCity = value;
    notifyListeners();
  }

  /// Field value changed
  void fieldValueChanged(
    FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>? field,
    dynamic value,
  ) {
    field?.didChange(value);
    notifyListeners();
  }

  /// Submit
  Future<void> submit() async {
    // Validate and save the form values
    if (formKey.currentState!.saveAndValidate(focusOnInvalid: false)) {
      debugPrint(formKey.currentState!.value.toString());

      // navigatorKey.currentState!.pushNamed(Routes.completeProfile);
    }
  }
}
