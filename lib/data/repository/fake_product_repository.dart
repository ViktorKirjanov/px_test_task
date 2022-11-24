import 'dart:math';

import '../../config/consts.dart';
import '../../models/product_model.dart';
import '../errors/exceptions.dart';
import 'product_repository.dart';

class FakeProductRepository implements ProductRepository {
  /// Get N products by [page].
  ///
  /// Throws a [ServerException] if an exception occurs.
  @override
  Future<List<Product>> getProducts({required int page}) async {
    await Future.delayed(Pagination.delay);

    Random rnd = Random();
    if (rnd.nextInt(10) != 9) {
      List<Product> products = [];
      final maxItems = page < 3 ? Pagination.productsLimit : 1;
      for (var i = 0; i < maxItems; i++) {
        final randYear = 1800 + rnd.nextInt(2000 - 1800);
        final randCode = 1111 + rnd.nextInt(9999 - 1111);
        products.add(
          Product(
            name: 'Springbank $randYear #$randCode',
            code: '(112/158)',
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
