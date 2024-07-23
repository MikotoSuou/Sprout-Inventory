import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/helpers.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/get_products_usecase.dart';

part 'products_state.dart';
part 'products_cubit.freezed.dart';

class ProductsCubit extends Cubit<ProductsState> {

  final GetProductsUseCase _getProductsUseCase;
  final Debounce _debounce;

  ProductsCubit(this._getProductsUseCase)
      : _debounce = Debounce(),
        super(const ProductsState());

  Future<void> getProducts() async {
    _debounce.run(() async {
      if(state.hasReachedMax) return;
      final result = await _getProductsUseCase(state.page);

      result.fold(
        (data) {
          final products = List.of(state.products)..addAll(data.products);
          final page = data.page + 1;
          final hasReachedMax = data.products.isEmpty;

          (products.isNotEmpty)
              ? emit(state.copyWith(status: ProductsStatus.success, products: products, page: page, hasReachedMax: hasReachedMax))
              : emit(state.copyWith(status: ProductsStatus.empty));
        },
        (error) {
          (state.products.isNotEmpty)
              ? emit(state.copyWith(status: ProductsStatus.failed, error: error.message))
              : emit(state.copyWith(status: ProductsStatus.empty));
        }
      );
    });
  }
}
