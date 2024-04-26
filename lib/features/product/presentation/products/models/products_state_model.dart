
import 'package:equatable/equatable.dart';
import 'package:sprout_inventory/features/product/domain/entities/product.dart';

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