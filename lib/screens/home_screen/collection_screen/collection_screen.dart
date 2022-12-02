import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:px_test_task/blocs/products_bloc/products_bloc.dart';
import 'package:px_test_task/config/custom_theme.dart';
import 'package:px_test_task/data/repository/product_repository.dart';
import 'package:px_test_task/screens/_widgets/try_again.dart';
import 'package:px_test_task/screens/home_screen/collection_screen/_widgets/end_of_list.dart';
import 'package:px_test_task/screens/home_screen/collection_screen/_widgets/notification_bell.dart';
import 'package:px_test_task/screens/home_screen/collection_screen/_widgets/pagination_loader.dart';
import 'package:px_test_task/screens/home_screen/collection_screen/_widgets/product_card.dart';
import 'package:px_test_task/screens/product_screen/product_screen.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('My collection'),
          centerTitle: false,
          actions: const [
            NotificationBell(),
          ],
        ),
        body: BlocProvider(
          create: (context) => ProductsBloc(
            context.read<ProductRepository>(),
          )..add(const GetProductsEvent(1)),
          child: const CollectionView(),
        ),
      );
}

class CollectionView extends StatelessWidget {
  const CollectionView({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is LoadingProductsState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CompleteProductsState) {
            if (!state.hasMorePages && state.products.isEmpty) {
              return Refresh(
                message: 'No  products',
                onPressed: () => BlocProvider.of<ProductsBloc>(context)
                    .add(const GetProductsEvent(1)),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<ProductsBloc>(context)
                    .add(const GetProductsEvent(1));
              },
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: CustomTheme.contentPadding,
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (index == state.products.length - 1) {
                            if (state.hasMorePages) {
                              BlocProvider.of<ProductsBloc>(context)
                                  .add(const GetProductsEvent(null));
                            }
                          }

                          return ProductCard(
                            product: state.products[index],
                            onTap: () =>
                                Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute<bool>(
                                builder: (BuildContext context) =>
                                    ProductScreen(
                                  product: state.products[index],
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: state.products.length,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: CustomTheme.productItemsInRow,
                        mainAxisSpacing: CustomTheme.productGridSpacing,
                        crossAxisSpacing: CustomTheme.productGridSpacing,
                        mainAxisExtent: CustomTheme.productItemHeight,
                      ),
                    ),
                  ),
                  if (state.hasMorePages) const PaginationLoader(),
                  if (!state.hasMorePages && state.products.isNotEmpty)
                    const EndOfList(),
                ],
              ),
            );
          } else if (state is ErrorProductsState) {
            return Refresh(
              message: 'Something went wrong.',
              onPressed: () => BlocProvider.of<ProductsBloc>(context)
                  .add(const GetProductsEvent(1)),
            );
          } else {
            return Container();
          }
        },
      );
}
