// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:collabverse/core/themes/base/color_scheme.dart';
import 'package:collabverse/core/themes/base/text_theme.dart';
import 'package:collabverse/core/themes/components/button_theme.dart';
import 'package:collabverse/core/themes/components/input_decoration_theme.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: colorScheme,
  textTheme: textTheme,
  inputDecorationTheme: inputDecorationTheme,
  filledButtonTheme: filledButtonTheme,
  outlinedButtonTheme: outlinedButtonTheme,
  textButtonTheme: textButtonTheme,
  iconButtonTheme: iconButtonTheme,
  // floatingActionButtonTheme: FloatingActionButtonThemeData(),
  // appBarTheme: AppBarTheme(),
  // dialogTheme: DialogThemeData(),
  disabledColor: Palette.disabled,
  dividerColor: Palette.disabled,
  hintColor: Palette.outlineVariant,
);
