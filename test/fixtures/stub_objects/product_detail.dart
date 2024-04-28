import 'package:sprout_inventory/features/product/data/responses/product_detail_response.dart';
import 'package:sprout_inventory/features/product/domain/entities/product_detail.dart';

const stubProductDetailRequest = "1";

const stubProductDetailResponse = ProductDetailResponse(
  id: 0,
  title: 'test',
  description: 'test',
  price: 1,
  discountPercentage: 1,
  rating: 1,
  stock: 1,
  brand: 'test',
  category: 'test',
  thumbnail: 'test',
  images: ['test'],
);

const stubProductDetail = ProductDetail(
  id: 0,
  title: 'test',
  description: 'test',
  originalPrice: '₱1.00',
  discountedPrice: '₱0.99',
  discountPercentage: 1,
  rating: 1,
  stock: 1,
  brand: 'test',
  category: 'test',
  thumbnail: 'test',
  images: ['test'],
);