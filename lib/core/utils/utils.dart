// Flutter imports:
import 'package:collabverse/core/utils/navigator_key.dart';
import 'package:collabverse/src/shared/widgets/loading_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:collabverse/core/extensions/text_style_extension.dart';

class Utils {
  /// Menampilkan dialog loading
  static void showLoadingDialog() {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: kDebugMode,
      builder: (_) => LoadingIndicator(radius: 24),
    );
  }

  /// Menutup dialog loading
  static void hideLoadingDialog() {
    navigatorKey.currentState!.pop();
  }

  /// Menampilkan snackbar dengan [message] dan opsional [action]
  static void showSnackBarMessage({
    required BuildContext context,
    required String message,
    SnackBarAction? action,
  }) {
    // Create snackbar
    final snackBar = SnackBar(
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodySmall!.semiBold.colorSurface(context),
      ),
      action: action,
      actionOverflowThreshold: 0.3,
      duration: Duration(seconds: 3),
    );

    // Show snackbar
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  /// Mengonversi kode negara menjadi emoji bendera
  static String convertCountryCodeToEmoji(String countryCode) {
    final base = 0x1F1E6;
    final firstChar = countryCode.codeUnitAt(0) - 'A'.codeUnitAt(0) + base;
    final secondChar = countryCode.codeUnitAt(1) - 'A'.codeUnitAt(0) + base;

    return String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
  }
}
