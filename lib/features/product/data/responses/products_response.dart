import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sprout_inventory/features/product/data/responses/product_response.dart';
part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse extends Equatable {
  @JsonKey(name: "products")
  final List<ProductResponse>? products;
  @JsonKey(name: "total")
  final int? total;
  @JsonKey(name: "skip")
  final int? skip;
  @JsonKey(name: "limit")
  final int? limit;

  const ProductsResponse({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) => _$ProductsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);

  @override
  List<Object?> get props => [
    products,
    total,
    skip,
    limit,
  ];
}