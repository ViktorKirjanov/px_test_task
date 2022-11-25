import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/custom_theme.dart';

class BottomNavigationIcon extends StatelessWidget {
  final bool isSelected;
  final String svgPath;

  const BottomNavigationIcon({
    super.key,
    required this.isSelected,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
}
