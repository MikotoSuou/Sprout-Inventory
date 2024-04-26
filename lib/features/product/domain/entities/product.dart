import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final String price;
  final String thumbnail;
  final int stock;
  final double discountPercentage;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.stock,
    required this.discountPercentage,
  });

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