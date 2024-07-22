part of 'product_detail_cubit.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState.loading() = _Loading;
  const factory ProductDetailState.loaded(ProductDetail productDetail) = _Loaded;
  const factory ProductDetailState.failed(String error) = _Failed;
}
