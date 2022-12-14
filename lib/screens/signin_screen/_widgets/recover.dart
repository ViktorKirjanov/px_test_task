import 'package:flutter/material.dart';
import 'package:px_test_task/config/custom_theme.dart';

class Recover extends StatelessWidget {
  const Recover({super.key});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Can’t sign in?',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: CustomTheme.grey2,
            ),
          ),
          const SizedBox(width: CustomTheme.smallSpacing),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: CustomTheme.mediumSpacing,
            ),
            height: 40.0,
            child: const Center(
              child: Text(
                'Recover password',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: CustomTheme.secondary,
                ),
              ),
            ),
          ),
        ],
      );
}
