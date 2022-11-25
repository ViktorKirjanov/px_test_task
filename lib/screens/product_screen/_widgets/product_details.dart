import 'package:flutter/material.dart';

import '../../../config/custom_theme.dart';
import '../../../models/product_model.dart';
import 'details_row.dart';
import 'product_groups.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: CustomTheme.mediumSpacing,
      ),
      child: Container(
        padding: CustomTheme.contentPadding,
        width: double.infinity,
        color: CustomTheme.black1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bottle ${product.bottle}',
              style: const TextStyle(
                fontFamily: 'Lato',
                color: CustomTheme.grey2,
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                height: 1.33,
              ),
            ),
            const SizedBox(height: CustomTheme.smallSpacing),
            RichText(
              text: TextSpan(
                text: '${product.name} ',
                style: const TextStyle(
                  color: CustomTheme.grey1,
                  fontFamily: 'EBGaramond',
                  fontSize: 32.0,
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
                children: [
                  TextSpan(
                    text: '${DateTime.now().year - product.year} Year old',
                    style: const TextStyle(
                      color: CustomTheme.primary,
                    ),
                  ),
                  TextSpan(text: ' #${product.code}'),
                ],
              ),
            ),
            const SizedBox(height: CustomTheme.largeSpacing),
            const ProductGroups(),
            const SizedBox(height: CustomTheme.largeSpacing),
            const DetailsRow(
              title: 'Distillery',
              text: 'Text',
            ),
            const DetailsRow(
              title: 'Region',
              text: 'Text',
            ),
            const DetailsRow(
              title: 'Country',
              text: 'Text',
            ),
            const DetailsRow(
              title: 'Type',
              text: 'Text',
            ),
            const DetailsRow(
              title: 'Age statement',
              text: 'Text',
            ),
            const DetailsRow(
              title: 'Filled',
              text: 'Text',
            ),
            const DetailsRow(
              title: 'Bottled',
              text: 'Text',
            ),
            const DetailsRow(
              title: 'Cask number',
              text: 'Text',
            ),
            const DetailsRow(
              title: 'ABV',
              text: 'Text',
            ),
            const DetailsRow(
              title: 'Size',
              text: 'Text',
            ),
            const DetailsRow(
              title: 'Finish',
              text: 'Text',
              hasBottomPadding: false,
            ),
          ],
        ),
      ),
    );
  }
}
