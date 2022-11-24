// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:px_test_task/blocs/products_bloc/products_bloc.dart';
import 'package:px_test_task/data/repository/product_repository.dart';
import 'package:px_test_task/models/product_model.dart';

class MockStoneRepository extends Mock implements ProductRepository {}

void main() {
  const products = [
    Product(
      name: 'name 1',
      year: 2000,
      code: 12345,
      bottle: '(123/456)',
      image: 'image.png',
    ),
  ];

  group('ProductsBloc', () {
    late ProductRepository productRepository;

    setUp(() {
      productRepository = MockStoneRepository();
    });

    ProductsBloc buildBloc() {
      return ProductsBloc(productRepository);
    }

    group('constructor', () {
      test('works properly', () {
        expect(buildBloc, returnsNormally);
      });

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(InitialProductsState()),
        );
      });
    });

    group('GetProductsEvent', () {
      blocTest<ProductsBloc, ProductsState>(
        'emits CompleteProductsState with no products',
        setUp: () {
          when(
            () => productRepository.getProducts(page: 1),
          ).thenAnswer(
            (_) async => Future.value([]),
          );
        },
        build: buildBloc,
        act: (bloc) async {
          bloc.add(const GetProductsEvent(1));
        },
        expect: () => [
          LoadingProductsState(),
          CompleteProductsState([], 1, false),
        ],
        verify: (_) =>
            verify(() => productRepository.getProducts(page: 1)).called(1),
      );

      blocTest<ProductsBloc, ProductsState>(
          'emits CompleteProductsState with products',
          setUp: () {
            when(
              () => productRepository.getProducts(page: 1),
            ).thenAnswer(
              (_) async => Future.value(products),
            );
          },
          build: buildBloc,
          act: (bloc) async {
            bloc.add(const GetProductsEvent(1));
          },
          expect: () => [
                LoadingProductsState(),
                CompleteProductsState(products, 2, false),
              ],
          verify: (_) {
            verify(() => productRepository.getProducts(page: 1)).called(1);
          });

      blocTest<ProductsBloc, ProductsState>(
        'emits ErrorStonesState',
        setUp: () {
          when(
            () => productRepository.getProducts(page: 1),
          ).thenThrow(Exception());
        },
        build: buildBloc,
        act: (bloc) async {
          bloc.add(const GetProductsEvent(1));
        },
        expect: () => [
          LoadingProductsState(),
          ErrorProductsState(),
        ],
        verify: (_) =>
            verify(() => productRepository.getProducts(page: 1)).called(1),
      );
    });
  });
}
