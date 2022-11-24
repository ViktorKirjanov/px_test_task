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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: CustomTheme.primaryText,
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
