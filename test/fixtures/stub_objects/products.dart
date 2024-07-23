import 'package:sprout_inventory/features/product/data/responses/products_response.dart';
import 'package:sprout_inventory/features/product/domain/entities/product.dart';
import 'package:sprout_inventory/features/product/domain/entities/products.dart';
import 'product.dart';

const stubProductsParam = 1;

const stubProductsRequest = "1";

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

const stubEmptyProducts = Products(
  products: <Product>[],
  total: 1,
  page: 1,
  limit: 1,
);