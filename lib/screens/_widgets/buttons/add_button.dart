import 'package:flutter/material.dart';

import '../../../config/custom_theme.dart';
import '../svg_icon.dart';

class AddButton extends StatelessWidget {
  final bool active;
  final Function? onPressed;

  const AddButton({
    Key? key,
    this.active = true,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CustomTheme.addButtonHeight,
      // width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(
              horizontal: CustomTheme.primarySpacing,
              vertical: CustomTheme.secondarySpacing,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: CustomTheme.borderRadius,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            active ? CustomTheme.primary : CustomTheme.primary.withOpacity(.5),
          ),
          overlayColor: MaterialStateProperty.all(
            CustomTheme.grey1.withOpacity(.2),
          ),
          foregroundColor: MaterialStateProperty.all(
            CustomTheme.black3,
          ),
        ),
        onPressed: onPressed != null ? () => onPressed!() : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SvgIcon(
              name: 'plus',
              color: CustomTheme.black3,
            ),
            SizedBox(width: CustomTheme.secondarySpacing),
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
}
