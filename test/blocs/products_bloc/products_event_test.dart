// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:px_test_task/blocs/products_bloc/products_bloc.dart';

void main() {
  group('ProductsEvent', () {
    group('GetProductsEvent', () {
      test('supports value equality', () {
        expect(
          GetProductsEvent(1),
          equals(GetProductsEvent(1)),
        );
      });

      test('props are correct', () {
        expect(
          GetProductsEvent(1).props,
          equals(<Object?>[1]),
        );
      });
    });
  });
}
