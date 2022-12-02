import 'package:flutter/material.dart';
import 'package:px_test_task/config/custom_theme.dart';
import 'package:px_test_task/screens/_widgets/svg_icon.dart';

class ProductStatus extends StatelessWidget {
  const ProductStatus({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CustomTheme.mediumSpacing,
        ),
        child: Container(
          color: CustomTheme.black3,
          height: 40.0,
          child: Padding(
            padding: const EdgeInsets.all(CustomTheme.smallSpacing),
            child: Row(
              children: [
                SizedBox(
                  height: CustomTheme.largeSpacing,
                  width: CustomTheme.largeSpacing - 1,
                  child: Image.asset('assets/images/genuine-icon.png'),
                ),
                const SizedBox(width: CustomTheme.smallSpacing),
                const Text(
                  'Genuine Bottle (Unopened)',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                const SvgIcon(
                  name: 'down',
                  color: CustomTheme.secondary,
                ),
              ],
            ),
          ),
        ),
      );
}
