import 'package:flutter/material.dart';
import 'package:px_test_task/config/custom_theme.dart';
import 'package:px_test_task/screens/_widgets/buttons/primary_button.dart';

class Refresh extends StatelessWidget {
  const Refresh({
    super.key,
    required this.message,
    required this.onPressed,
  });

  final String message;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => Padding(
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
            const SizedBox(height: CustomTheme.mediumSpacing),
            PrimaryButton(
              title: 'Refresh',
              onPressed: onPressed,
            )
          ],
        ),
      );
}
