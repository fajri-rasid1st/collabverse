// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:collabverse/core/themes/base/color_scheme.dart';

final inputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.never,
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Palette.error,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Palette.error,
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Palette.outlineVariant,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Palette.outlineVariant,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Palette.primary,
    ),
  ),
);
