import 'package:flutter/material.dart';
import 'package:px_test_task/config/custom_theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    this.active = true,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final bool active;
  final void Function()? onPressed;

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
              active
                  ? CustomTheme.primary
                  : CustomTheme.primary.withOpacity(.5),
            ),
            overlayColor: MaterialStateProperty.all(
              CustomTheme.grey1.withOpacity(.2),
            ),
            foregroundColor: MaterialStateProperty.all(
              CustomTheme.black3,
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
          ),
        ),
      );
}
