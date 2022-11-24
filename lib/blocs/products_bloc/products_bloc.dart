import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:px_test_task/data/repository/product_repository.dart';
import 'package:px_test_task/models/product_model.dart';

import '../../config/consts.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository _productRepository;

  ProductsBloc(this._productRepository) : super(InitialProductsState()) {
    List<Product> productList = [];
    int currentPage = 1;

    on<GetProductsEvent>((event, emit) async {
      try {
        if (event.page == 1) {
          currentPage = 1;
          productList = [];
          emit(LoadingProductsState());
        }
        final products = await _productRepository.getProducts(
          page: event.page ?? currentPage,
        );

        if (products.isNotEmpty) {
          currentPage++;
          if (event.page == 1) {
            productList = products;
          } else {
            productList.addAll(products);
          }
        }
        emit(CompleteProductsState(
          productList,
          currentPage,
          products.length == Pagination.productsLimit,
        ));
      } catch (_) {
        emit(ErrorProductsState());
      }
    });
  }
}
