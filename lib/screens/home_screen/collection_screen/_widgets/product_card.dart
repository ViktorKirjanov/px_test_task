import 'package:flutter/material.dart';
import 'package:px_test_task/config/custom_theme.dart';
import 'package:px_test_task/models/product_model.dart';
import 'package:px_test_task/screens/_widgets/opacity_animation.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  final Product product;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => Material(
        color: CustomTheme.black1,
        child: InkWell(
          splashColor: CustomTheme.splashColor,
          highlightColor: CustomTheme.highlightColor,
          onTap: onTap,
          child: OpacityAnimation(
            delayed: 0,
            duration: 300,
            curve: Curves.easeIn,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                CustomTheme.mediumSpacing,
                CustomTheme.mediumSpacing,
                CustomTheme.mediumSpacing,
                0.0,
              ),
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
                  const SizedBox(height: CustomTheme.mediumSpacing),
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
        ),
      );
}
