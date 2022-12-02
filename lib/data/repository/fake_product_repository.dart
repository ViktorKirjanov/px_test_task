import 'dart:math';

import 'package:px_test_task/config/consts.dart';
import 'package:px_test_task/data/errors/exceptions.dart';
import 'package:px_test_task/data/repository/product_repository.dart';
import 'package:px_test_task/models/product_model.dart';

class FakeProductRepository implements ProductRepository {
  /// Get N products by [page].
  ///
  /// Throws a [ServerException] if an exception occurs.
  @override
  Future<List<Product>> getProducts({required int page}) async {
    await Future<void>.delayed(Pagination.delay);

    final rnd = Random();
    if (rnd.nextInt(10) != 9) {
      final List<Product> products = [];
      final maxItems = page < 3 ? Pagination.productsLimit : 1;
      for (var i = 0; i < maxItems; i++) {
        final randYear = 1800 + rnd.nextInt(2000 - 1800);
        final randCode = 1111 + rnd.nextInt(9999 - 1111);
        products.add(
          Product(
            name: 'Springbank',
            year: randYear,
            code: randCode,
            bottle: '(112/158)',
            image: 'assets/images/one_cask.png',
          ),
        );
      }

      return products;
    } else {
      throw ServerException();
    }
  }
}
