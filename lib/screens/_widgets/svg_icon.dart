import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:px_test_task/config/custom_theme.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    super.key,
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: CustomTheme.largeSpacing,
        width: CustomTheme.largeSpacing,
        child: Center(
          child: SvgPicture.asset(
            'assets/svg/$name.svg',
            color: color,
          ),
        ),
      );
}
