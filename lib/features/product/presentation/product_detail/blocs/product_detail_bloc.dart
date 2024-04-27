import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sprout_inventory/features/product/domain/entities/product_detail.dart';
import 'package:sprout_inventory/features/product/domain/usecases/get_product_detail_usecase.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {

  final GetProductDetailUseCase _getProductDetailUseCase;
  
  ProductDetailBloc(this._getProductDetailUseCase) : super(const ProductDetailInitial()) {
    on<GetProductDetail>(_onGetProductDetail);
  }

  Future<void> _onGetProductDetail(
    GetProductDetail event,
    Emitter<ProductDetailState> emit
  ) async {
    emit(const ProductDetailLoading());
    final result = await _getProductDetailUseCase(event.productId);

    result.fold(
      (data) => emit(ProductDetailLoaded(productDetail: data)),
      (error) => emit(ProductDetailLoadFailed(error: error.message)),
    );
  }
}
