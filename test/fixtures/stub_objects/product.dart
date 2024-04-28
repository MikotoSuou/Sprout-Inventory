import 'package:sprout_inventory/features/product/data/responses/product_response.dart';
import 'package:sprout_inventory/features/product/domain/entities/product.dart';

const stubProductResponse = ProductResponse(
  id: 0,
  title: 'test',
  price: 1,
  thumbnail: 'test',
  stock: 1,
  discountPercentage: 1,
);

const stubProduct = Product(
  id: 0,
  title: 'test',
  price: '₱1.00',
  thumbnail: 'test',
  stock: 1,
  discountPercentage: 1,
);