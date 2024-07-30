import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sprout_inventory/features/product/domain/usecases/get_products_usecase.dart';

import '../../../../../core/utils/helpers.dart';
import '../../../domain/entities/product.dart';

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
    final result = await _getProductsUseCase(state.productsState.page);

    result.fold(
      (data) {
        final products = List.of(state.productsState.products)..addAll(data.products);
        final page = data.page + 1;
        final hasReachedMax = (data.products.isEmpty);

        (products.isNotEmpty)
            ? emit(ProductsLoaded(productsState: state.productsState.copyWith(products: products, page: page, hasReachedMax: hasReachedMax)))
            : emit(const ProductsEmpty());
      },
      (error) {
        emit(ProductsLoadFailed(productsState: state.productsState, error: error.message));
      },
    );
  }
}