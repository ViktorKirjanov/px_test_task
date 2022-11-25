import 'package:flutter/material.dart';

import '../../../config/custom_theme.dart';
import '../../_widgets/svg_icon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: CustomTheme.mediumSpacing,
      ),
      height: 72.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: CustomTheme.smallSpacing / 2,
              horizontal: CustomTheme.smallSpacing,
            ),
            color: CustomTheme.black3,
            child: const Text(
              'Genesis Collection',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
            width: 40.0,
            child: Material(
              color: CustomTheme.black3,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: InkWell(
                splashColor: CustomTheme.splashColor,
                highlightColor: CustomTheme.highlightColor,
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                child: Container(
                  alignment: Alignment.center,
                  child: const SvgIcon(
                    name: 'x',
                    color: CustomTheme.grey1,
                  ),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
