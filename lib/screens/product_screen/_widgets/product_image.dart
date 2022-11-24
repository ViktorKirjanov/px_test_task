import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 33.0,
        vertical: 39.0,
      ),
      child: SizedBox(
        height: 411,
        child: Image.asset(
          'assets/images/one_cask_big.png',
        ),
      ),
    );
  }
}
