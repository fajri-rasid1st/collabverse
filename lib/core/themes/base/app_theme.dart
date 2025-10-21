// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:collabverse/core/themes/base/color_scheme.dart';
import 'package:collabverse/core/themes/base/text_theme.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: colorScheme,
  textTheme: textTheme,
  appBarTheme: AppBarTheme(),
  inputDecorationTheme: InputDecorationTheme(),
  floatingActionButtonTheme: FloatingActionButtonThemeData(),
  dialogTheme: DialogThemeData(),
  disabledColor: Palette.disabled,
  dividerColor: Palette.disabled,
);
