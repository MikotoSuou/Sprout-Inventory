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

final class ProductsSuccess extends ProductsState {
  const ProductsSuccess({required super.productsState});
}

final class ProductsFailed extends ProductsState {
  final String error;

  const ProductsFailed({
    required super.productsState,
    required this.error
  });

  @override
  List<Object> get props => [error];
}

final class ProductsEmpty extends ProductsState {
  const ProductsEmpty();
}