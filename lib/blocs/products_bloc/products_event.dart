part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

class GetProductsEvent extends ProductsEvent {
  final int? page;

  const GetProductsEvent(this.page);

  @override
  List<Object?> get props => [page];
}
