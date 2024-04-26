import 'package:equatable/equatable.dart';
import 'package:sprout_inventory/features/product/domain/entities/product.dart';


class Products extends Equatable {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  const Products({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  @override
  List<Object?> get props => [
    products,
    total,
    skip,
    limit,
  ];
}