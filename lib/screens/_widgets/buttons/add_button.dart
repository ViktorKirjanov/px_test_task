import 'package:flutter/material.dart';
import 'package:px_test_task/config/custom_theme.dart';
import 'package:px_test_task/screens/_widgets/svg_icon.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    this.active = true,
    required this.onPressed,
  }) : super(key: key);

  final bool active;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: CustomTheme.addButtonHeight,
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(
                horizontal: CustomTheme.mediumSpacing,
                vertical: CustomTheme.smallSpacing,
              ),
            ),
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
          onPressed: () {},
          // onPressed: onPressed != null ? () => onPressed : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SvgIcon(
                name: 'plus',
                color: CustomTheme.black3,
              ),
              SizedBox(width: CustomTheme.smallSpacing),
              Text(
                'Add to my collection',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
}
