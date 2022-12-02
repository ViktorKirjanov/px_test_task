part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

class GetProductsEvent extends ProductsEvent {
  const GetProductsEvent(this.page);

  final int? page;

  @override
  List<Object?> get props => [page];
}
