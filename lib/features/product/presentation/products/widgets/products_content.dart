
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sprout_inventory/core/utils/helpers.dart';
import 'package:sprout_inventory/core/utils/logger.dart';
import 'package:sprout_inventory/core/utils/widgets.dart';
import 'package:sprout_inventory/features/product/presentation/products/blocs/products/products_bloc.dart';
import 'package:sprout_inventory/features/product/presentation/products/models/products_state_model.dart';
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
      context.read<ProductsBloc>().add(const ProductsGetItems());
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
  Widget build(BuildContext context) => BlocConsumer<ProductsBloc, ProductsState>(
    listener: (context, state) {
      if(state is ProductsFailed) {
        logger.d("ProductsState :: failed");
        showErrorSnackBar(context, error: state.error);
      }
    },
    builder: (context, state) => switch (state) {
      ProductsLoading() => const Center(child: CircularProgressIndicator()),
      ProductsSuccess() || ProductsFailed() => _buildProducts(state.productsState),
      ProductsEmpty() => const Center(child: Text(Strings.noProductsToView)),
    },
  );

  Widget _buildProducts(ProductsStateModel state) => MasonryGridView.count(
    controller: _scrollController,
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 5,
    padding: const EdgeInsets.symmetric(vertical: values.Padding.p10),
    itemCount: (state.hasReachedMax)
        ? state.products.length
        : state.products.length + 2,
    itemBuilder: (BuildContext context, int index) {
      return (index >= state.products.length)
          ? const ShimmerWidget(height: values.Size.s180)
          : ProductTile(product: state.products[index]);
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