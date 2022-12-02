import 'package:px_test_task/models/product_model.dart';

abstract class ProductRepository {
  /// Get N products by [page].
  Future<List<Product>> getProducts({required int page});
}
