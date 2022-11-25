import 'package:flutter/material.dart';

import '../../config/custom_theme.dart';
import 'buttons/primary_button.dart';

class Refresh extends StatelessWidget {
  final String message;
  final Function onPressed;

  const Refresh({
    super.key,
    required this.message,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomTheme.contentPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(
              color: CustomTheme.grey1,
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 16.0),
          PrimaryButton(
            title: 'Refresh',
            onPressed: () => onPressed(),
          )
        ],
      ),
    );
  }
}
