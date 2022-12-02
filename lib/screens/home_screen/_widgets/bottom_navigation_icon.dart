import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:px_test_task/config/custom_theme.dart';

class BottomNavigationIcon extends StatelessWidget {
  const BottomNavigationIcon({
    super.key,
    required this.isSelected,
    required this.svgPath,
  });

  final bool isSelected;
  final String svgPath;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: CustomTheme.smallSpacing),
        child: SizedBox(
          height: CustomTheme.largeSpacing,
          width: CustomTheme.largeSpacing,
          child: SvgPicture.asset(
            svgPath,
            color: isSelected ? CustomTheme.white : CustomTheme.grey3,
          ),
        ),
      );
}
