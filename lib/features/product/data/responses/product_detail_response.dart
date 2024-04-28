import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_detail_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductDetailResponse extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "discountPercentage")
  final double? discountPercentage;
  @JsonKey(name: "rating")
  final double? rating;
  @JsonKey(name: "stock")
  final int? stock;
  @JsonKey(name: "brand")
  final String? brand;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "thumbnail")
  final String? thumbnail;
  @JsonKey(name: "images")
  final List<String>? images;

  const ProductDetailResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) => _$ProductDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailResponseToJson(this);

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    price,
    discountPercentage,
    rating,
    stock,
    brand,
    category,
    thumbnail,
    images,
  ];
}