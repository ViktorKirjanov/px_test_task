import 'package:flutter/material.dart';
import 'package:px_test_task/config/custom_theme.dart';
import 'package:px_test_task/models/product_model.dart';
import 'package:px_test_task/screens/_widgets/buttons/add_button.dart';
import 'package:px_test_task/screens/product_screen/_widgets/custom_appbar.dart';
import 'package:px_test_task/screens/product_screen/_widgets/product_details.dart';
import 'package:px_test_task/screens/product_screen/_widgets/product_image.dart';
import 'package:px_test_task/screens/product_screen/_widgets/product_options.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final minHeight = MediaQuery.of(context).size.height;

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
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
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
                    const SizedBox(height: CustomTheme.mediumSpacing),
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
