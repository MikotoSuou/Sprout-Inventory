
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sprout_inventory/core/utils/helpers.dart';
import 'package:sprout_inventory/core/utils/widgets.dart';
import 'package:sprout_inventory/features/product/domain/entities/product.dart';
import 'package:sprout_inventory/features/product/presentation/products/cubit/products_cubit.dart';
import 'package:sprout_inventory/features/product/presentation/products/widgets/product_tile.dart';
import 'package:sprout_inventory/res/strings.dart';
import 'package:sprout_inventory/res/values.dart' as values;

class ProductsContent extends StatefulWidget {
  const ProductsContent({super.key});

  @override
  State<ProductsContent> createState() => _ProductsContentState();
}

class _ProductsContentState extends State<ProductsContent> {
  final _scrollController = ScrollController();


  void _loadProducts() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsCubit>().getProducts();
    });
  }

  void _onScroll() {
    if (_isBottom) _loadProducts();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<ProductsCubit, ProductsState>(
    listener: (context, state) => switch(state.status) {
      ProductsStatus.failed => showErrorSnackBar(context, error: state.error),
      _ => {}
    },
    builder: (context, state) => switch (state.status) {
      ProductsStatus.loading => _buildLoading(),
      ProductsStatus.success || ProductsStatus.failed => _buildProducts(state.products, state.hasReachedMax),
      ProductsStatus.empty => const Center(child: Text(Strings.noProductsToView)),
    },
  );

  Widget _buildLoading() => const Align(
    alignment: Alignment.topCenter,
    child: Row(
      children: [
        Expanded(child: ShimmerWidget(height: values.Size.s180)),

        Space(width: values.Size.s10),

        Expanded(child: ShimmerWidget(height: values.Size.s180))
      ],
    ),
  );

  Widget _buildProducts(
    List<Product> products,
    bool hasReachedMax,
  ) => MasonryGridView.count(
    controller: _scrollController,
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 5,
    padding: const EdgeInsets.only(
      top: values.Padding.p10,
      bottom: values.Padding.p20,
    ),
    itemCount: (hasReachedMax)
        ? products.length
        : products.length + 2,
    itemBuilder: (BuildContext context, int index) {
      return (index >= products.length)
          ? const ShimmerWidget(height: values.Size.s180)
          : ProductTile(product: products[index]);
    },
  );

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}