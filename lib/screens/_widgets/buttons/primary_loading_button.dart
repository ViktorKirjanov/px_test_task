import 'package:flutter/material.dart';
import 'package:px_test_task/config/custom_theme.dart';

class PrimaryLoadingButton extends StatelessWidget {
  const PrimaryLoadingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: CustomTheme.buttonHeight,
        width: double.infinity,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: CustomTheme.borderRadius,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              CustomTheme.primary,
            ),
            overlayColor: MaterialStateProperty.all(
              CustomTheme.primary,
            ),
            foregroundColor: MaterialStateProperty.all(
              CustomTheme.black3,
            ),
          ),
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(CustomTheme.black3),
            strokeWidth: 2.5,
          ),
          onPressed: () {},
        ),
      );
}
