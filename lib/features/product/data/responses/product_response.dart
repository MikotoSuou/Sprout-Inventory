import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "thumbnail")
  final String? thumbnail;
  @JsonKey(name: "stock")
  final int? stock;
  @JsonKey(name: "discountPercentage")
  final double? discountPercentage;

  const ProductResponse({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.stock,
    required this.discountPercentage,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) => _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

  @override
  List<Object?> get props => [
    id,
    title,
    price,
    thumbnail,
    stock,
    discountPercentage,
  ];
}