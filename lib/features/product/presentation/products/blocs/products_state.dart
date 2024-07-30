part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  final ProductsStateModel productsState;

  const ProductsState({
    this.productsState = const ProductsStateModel(),
  });

  @override
  List<Object> get props => [productsState];
}

final class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

final class ProductsLoaded extends ProductsState {
  const ProductsLoaded({required super.productsState});
}

final class ProductsLoadFailed extends ProductsState {
  final String error;

  const ProductsLoadFailed({
    required super.productsState,
    required this.error
  });

  @override
  List<Object> get props => [error];
}

final class ProductsEmpty extends ProductsState {
  const ProductsEmpty();
}

// core data
class ProductsStateModel extends Equatable {
  final List<Product> products;
  final int page;
  final bool hasReachedMax;

  const ProductsStateModel({
    this.products = const <Product>[],
    this.page = 0,
    this.hasReachedMax = false,
  });

  ProductsStateModel copyWith({
    List<Product>? products,
    int? page,
    bool? hasReachedMax,
  }) => ProductsStateModel(
    products: products ?? this.products,
    page: page ?? this.page,
    hasReachedMax: hasReachedMax ?? this.hasReachedMax,
  );

  @override
  List<Object> get props => [products, page, hasReachedMax];
}