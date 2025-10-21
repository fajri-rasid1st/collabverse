// Flutter imports:
import 'package:flutter/material.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: Palette.primaryColor,
  primary: Palette.primaryColor,
  onPrimary: Palette.onPrimary,
  primaryContainer: Palette.primaryContainer,
  onPrimaryContainer: Palette.onPrimaryContainer,
  secondary: Palette.secondary,
  onSecondary: Palette.onSecondary,
  secondaryContainer: Palette.secondaryContainer,
  onSecondaryContainer: Palette.onSecondaryContainer,
  tertiary: Palette.tertiary,
  onTertiary: Palette.onTertiary,
  tertiaryContainer: Palette.tertiaryContainer,
  onTertiaryContainer: Palette.onTertiaryContainer,
  error: Palette.error,
  onError: Palette.onError,
  errorContainer: Palette.errorContainer,
  onErrorContainer: Palette.onErrorContainer,
  surface: Palette.surface,
  onSurface: Palette.onSurface,
  onSurfaceVariant: Palette.onSurfaceVariant,
  outline: Palette.outline,
  outlineVariant: Palette.outlineVariant,
);

class Palette {
  // Core / Primary
  static const primaryColor = Color(0xFF482477);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFFE9DDFF);
  static const onPrimaryContainer = Color(0xFF23123D);

  // Secondary
  static const secondary = Color(0xFF6B5AA7);
  static const onSecondary = Color(0xFFFFFFFF);
  static const secondaryContainer = Color(0xFFE7E1FF);
  static const onSecondaryContainer = Color(0xFF23123D);

  // Tertiary
  static const tertiary = Color(0xFFB05C8E);
  static const onTertiary = Color(0xFFFFFFFF);
  static const tertiaryContainer = Color(0xFFFFD7E8);
  static const onTertiaryContainer = Color(0xFF3F0E2A);

  // Neutrals / Surfaces
  static const surface = Color(0xFFFFFFFF);
  static const onSurface = Color(0xFF211F25);
  static const onSurfaceVariant = Color(0xFF49454F);
  static const outline = Color(0xFF79747E);
  static const outlineVariant = Color(0xFFB1ACB6);
  static const disabled = Color(0xFFE2E0E6);

  // Error
  static const error = Color(0xFFC72920);
  static const onError = Color(0xFFFFFFFF);
  static const errorContainer = Color(0xFFF9DEDC);
  static const onErrorContainer = Color(0xFF3F0E2A);
}
