// Flutter imports:
import 'package:flutter/material.dart';

extension ExpandedButton on ButtonStyleButton {
  SizedBox expand() {
    return SizedBox(
      width: double.infinity,
      child: this,
    );
  }
}
