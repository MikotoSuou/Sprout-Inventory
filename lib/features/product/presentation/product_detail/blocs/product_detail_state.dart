part of 'product_detail_bloc.dart';

sealed class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

class ProductDetailInitial extends ProductDetailState {
  const ProductDetailInitial();
}

class ProductDetailLoading extends ProductDetailState {
  const ProductDetailLoading();
}

class ProductDetailLoaded extends ProductDetailState {
  final ProductDetail productDetail;

  const ProductDetailLoaded({required this.productDetail});

  @override
  List<Object> get props => [productDetail];
}

class ProductDetailLoadFailed extends ProductDetailState {
  final String error;

  const ProductDetailLoadFailed({required this.error});

  @override
  List<Object> get props => [error];
}