import 'package:px_test_task/models/product_model.dart';

abstract class ProductRepository {
  /// Get N products by [page].
  ///
  /// Throws a [ServerException] if an exception occurs.
  Future<List<Product>> getProducts({required int page});
}
