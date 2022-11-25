import 'package:flutter/material.dart';

import '../../../../../config/custom_theme.dart';
import '../../../../../models/product_model.dart';
import '../../../_widgets/opacity_animation.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomTheme.black1,
      child: InkWell(
        splashColor: CustomTheme.splashColor,
        highlightColor: CustomTheme.highlightColor,
        child: OpacityAnimation(
          delayed: 0,
          duration: 300,
          curve: Curves.easeIn,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 189.0,
                  child: Center(
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  '${product.name} ${product.year} #${product.code}',
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    height: 1.27,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  product.bottle,
                  style: const TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    height: 1.23,
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () => onTap(),
      ),
    );
  }
}
