import 'package:flutter/material.dart';

import '../../config/custom_theme.dart';
import '../../models/product_model.dart';
import '../_widgets/buttons/add_button.dart';
import '_widgets/custom_appbar.dart';
import '_widgets/product_details.dart';
import '_widgets/product_image.dart';
import '_widgets/product_options.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var minHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: CustomTheme.black3,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                minHeight: minHeight,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.jpg"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    const CustomAppbar(),
                    const ProductStatus(),
                    const SizedBox(height: 13.0),
                    const ProductImage(),
                    ProductDetails(product: product),
                    const SizedBox(height: 40.0),
                    AddButton(onPressed: () {}),
                    const SizedBox(height: CustomTheme.primarySpacing),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
