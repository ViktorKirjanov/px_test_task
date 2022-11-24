import 'package:flutter/material.dart';

import '../../../../../config/custom_theme.dart';
import '../../../../../models/product_model.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onTap;

  const ProductItem({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomTheme.black1,
      child: InkWell(
        splashColor: CustomTheme.secondary.withOpacity(.5),
        highlightColor: CustomTheme.secondary.withOpacity(.1),
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
                product.name,
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  height: 1.27,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                product.code,
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
        onTap: () => onTap(),
      ),
    );
  }
}
