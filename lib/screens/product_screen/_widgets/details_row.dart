import 'package:flutter/material.dart';
import 'package:px_test_task/config/custom_theme.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({
    super.key,
    required this.title,
    required this.text,
    this.hasBottomPadding = true,
  });

  final String title;
  final String text;
  final bool hasBottomPadding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          bottom: hasBottomPadding ? CustomTheme.mediumSpacing : 0.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Lato',
                color: CustomTheme.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'Lato',
                color: CustomTheme.grey2,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ],
        ),
      );
}
