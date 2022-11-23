import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../config/custom_theme.dart';

class CustomMessager {
  void showError({
    required BuildContext context,
    required String message,
    duration = const Duration(seconds: 5),
  }) {
    Flushbar(
      margin: CustomTheme.contentPadding,
      borderRadius: CustomTheme.borderRadius,
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: CustomTheme.red,
      messageText: Text(
        message,
        style: const TextStyle(fontFamily: 'Lato'),
      ),
      messageColor: CustomTheme.white,
      icon: const Icon(
        Icons.error_outline_rounded,
        size: 28.0,
        color: CustomTheme.white,
      ),
      duration: duration,
    ).show(context);
  }
}
