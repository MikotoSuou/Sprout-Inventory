import 'package:equatable/equatable.dart';

class ProductDetail extends Equatable {
  final int id;
  final String title;
  final String description;
  final String originalPrice;
  final String discountedPrice;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  const ProductDetail({
    required this.id,
    required this.title,
    required this.description,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    originalPrice,
    discountedPrice,
    discountPercentage,
    rating,
    stock,
    brand,
    category,
    thumbnail,
    images,
  ];
}