import 'package:flutter/material.dart';

import '../../_widgets/opacity_animation.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return OpacityAnimation(
      delayed: 250,
      duration: 750,
      curve: Curves.bounceInOut,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 33.0,
          vertical: 39.0,
        ),
        child: SizedBox(
          height: 411,
          child: Image.asset('assets/images/one_cask_big.png'),
        ),
      ),
    );
  }
}
