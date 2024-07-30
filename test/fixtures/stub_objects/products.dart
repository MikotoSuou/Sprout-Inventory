import 'package:sprout_inventory/features/product/data/responses/products_response.dart';
import 'package:sprout_inventory/features/product/domain/entities/products.dart';
import 'product.dart';

const stubProductsResponse = ProductsResponse(
  products: [ stubProductResponse ],
  total: 1,
  page: 1,
  limit: 1,
);

const stubProducts = Products(
  products: [ stubProduct ],
  total: 1,
  page: 1,
  limit: 1,
);