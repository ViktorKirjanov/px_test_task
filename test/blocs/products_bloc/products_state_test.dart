// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:px_test_task/blocs/products_bloc/products_bloc.dart';
import 'package:px_test_task/models/product_model.dart';

void main() {
  group('ProductsState', () {
    group('InitialProductsState', () {
      test('supports value comparison', () {
        expect(InitialProductsState(), InitialProductsState());
      });
    });

    group('LoadingProductsState', () {
      test('supports value comparison', () {
        expect(LoadingProductsState(), LoadingProductsState());
      });
    });

    group('CompleteProductsState', () {
      test('supports value comparison', () {
        final products = [
          Product(
              name: 'name 1',
              year: 2000,
              code: 12345,
              bottle: '(123/456)',
              image: 'image.png'),
          Product(
              name: 'name 2',
              year: 2000,
              code: 12345,
              bottle: '(123/456)',
              image: 'image.png'),
          Product(
              name: 'name 3',
              year: 2000,
              code: 12345,
              bottle: '(123/456)',
              image: 'image.png'),
        ];
        expect(
          CompleteProductsState(products, 1, false),
          CompleteProductsState(products, 1, false),
        );
      });
    });

    group('ErrorProductsState', () {
      test('supports value comparison', () {
        expect(ErrorProductsState(), ErrorProductsState());
      });
    });
  });
}
