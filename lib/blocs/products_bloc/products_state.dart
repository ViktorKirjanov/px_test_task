part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class InitialProductsState extends ProductsState {}

class LoadingProductsState extends ProductsState {}

class CompleteProductsState extends ProductsState {
  const CompleteProductsState(this.products, this.page, this.hasMorePages);

  final List<Product> products;
  final int page;
  final bool hasMorePages;

  @override
  List<Object> get props => [products, page, hasMorePages];
}

class ErrorProductsState extends ProductsState {}
