import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sprout_inventory/features/product/domain/entities/product_detail.dart';

import '../../../domain/usecases/get_product_detail_usecase.dart';

part 'product_detail_state.dart';
part 'product_detail_cubit.freezed.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final GetProductDetailUseCase _getProductDetailUseCase;

  ProductDetailCubit(this._getProductDetailUseCase) : super(const ProductDetailState.loading());

  Future<void> getProductDetail({required int productId}) async {
    final result = await _getProductDetailUseCase(productId);

    result.fold(
      (data) => emit(ProductDetailState.loaded(data)),
      (error) => emit(ProductDetailState.failed(error.message)),
    );
  }
}
