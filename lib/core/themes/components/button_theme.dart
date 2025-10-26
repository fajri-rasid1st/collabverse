// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:collabverse/core/extensions/text_style_extension.dart';
import 'package:collabverse/core/themes/base/color_scheme.dart';
import 'package:collabverse/core/themes/base/text_theme.dart';

final filledButtonTheme = FilledButtonThemeData(
  style: FilledButton.styleFrom(
    textStyle: textTheme.titleSmall!.bold,
    backgroundColor: Palette.primary,
    foregroundColor: Palette.surface,
    disabledBackgroundColor: Palette.disabled,
    disabledForegroundColor: Palette.outlineVariant,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(999),
    ),
  ),
);

final outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    textStyle: textTheme.titleSmall!.bold,
    foregroundColor: Palette.onSurface,
    disabledForegroundColor: Palette.outlineVariant,
    side: BorderSide(
      color: Palette.outlineVariant,
    ),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(999),
    ),
  ),
);

final textButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    textStyle: textTheme.titleSmall!.bold,
    foregroundColor: Palette.primary,
    disabledForegroundColor: Palette.outlineVariant,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(999),
    ),
  ),
);

final iconButtonTheme = IconButtonThemeData(
  style: IconButton.styleFrom(
    foregroundColor: Palette.primary,
    backgroundColor: Palette.primaryContainer,
    disabledForegroundColor: Palette.outlineVariant,
    disabledBackgroundColor: Palette.disabled,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(999),
    ),
  ),
);
