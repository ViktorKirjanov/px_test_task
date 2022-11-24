import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String name;
  final Color color;

  const SvgIcon({
    super.key,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.0,
      width: 24.0,
      child: Center(
        child: SvgPicture.asset(
          'assets/svg/$name.svg',
          color: color,
        ),
      ),
    );
  }
}
