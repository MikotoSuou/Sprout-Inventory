import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sprout_inventory/features/product/domain/usecases/get_products_usecase.dart';

import '../../../../../core/utils/helpers.dart';
import '../models/products_state_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {

  final GetProductsUseCase _getProductsUseCase;

  ProductsBloc(this._getProductsUseCase) : super(const ProductsLoading()) {
    on<GetProducts>(
      _onGetProducts,
      transformer: debounceEvent(duration: const Duration(milliseconds: 100)),
    );
  }

  Future<void> _onGetProducts(
    GetProducts event,
    Emitter<ProductsState> emit
  ) async {
    if(state.productsState.hasReachedMax) return;
    if(state.productsState.page == 0) emit(const ProductsLoading());
    final result = await _getProductsUseCase(state.productsState.page);

    result.fold(
      (data) {
        final products = List.of(state.productsState.products)..addAll(data.products);
        // final filteredProducts = removeDuplicates(products);
        final page = data.page + 1;
        final hasReachedMax = (data.products.isEmpty);
        final productsState = state.productsState.copyWith(products: products, page: page, hasReachedMax: hasReachedMax);

        (products.isEmpty)
            ? emit(const ProductsEmpty())
            : emit(ProductsLoaded(productsState: productsState));
      },
      (error) {
        (state.productsState.products.isEmpty)
            ? emit(const ProductsEmpty())
            : emit(ProductsLoadFailed(productsState: state.productsState, error: error.message));
      },
    );
  }
}

// List<T> removeDuplicates<T>(List<T> list) {
//   // Convert the list to a set to remove duplicates
//   Set<T> set = list.toSet();
//   // Convert the set back to a list
//   List<T> result = set.toList();
//   return result;
// }
