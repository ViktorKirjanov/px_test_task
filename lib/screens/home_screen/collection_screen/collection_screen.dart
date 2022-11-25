import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/products_bloc/products_bloc.dart';
import '../../../config/custom_theme.dart';
import '../../../data/repository/product_repository.dart';
import '../../_widgets/try_again.dart';
import '../../product_screen/product_screen.dart';
import '_widgets/end_of_list.dart';
import '_widgets/notification_bell.dart';
import '_widgets/pagination_loader.dart';
import '_widgets/product_card.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
}

class CollectionView extends StatelessWidget {
  const CollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
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
                                  ProductScreen(product: state.products[index]),
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
}
