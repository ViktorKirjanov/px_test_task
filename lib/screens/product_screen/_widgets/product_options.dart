import 'package:flutter/material.dart';

import '../../../config/custom_theme.dart';
import '../../_widgets/svg_icon.dart';

class ProductStatus extends StatelessWidget {
  const ProductStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        color: CustomTheme.black3,
        height: 40.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                height: 24.0,
                width: 23.0,
                child: Image.asset("assets/images/genuine-icon.png"),
              ),
              const SizedBox(width: 8.0),
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
}
