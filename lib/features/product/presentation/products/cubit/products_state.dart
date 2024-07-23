part of 'products_cubit.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    @Default(ProductsStatus.loading) ProductsStatus status,
    @Default([]) List<Product> products,
    @Default(0) int page,
    @Default(false) bool hasReachedMax,
    @Default('') String error,
  }) = _ProductsState;
}

enum ProductsStatus { loading, success, failed, empty }