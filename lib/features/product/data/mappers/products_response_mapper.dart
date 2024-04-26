
import 'package:sprout_inventory/features/product/data/mappers/product_response_mapper.dart';
import 'package:sprout_inventory/features/product/data/responses/product_response.dart';
import 'package:sprout_inventory/features/product/domain/entities/products.dart';

import '../responses/products_response.dart';

extension ProductResponseMapper on ProductsResponse? {
  Products get toDomain {
    final productsResponse = this?.products ?? <ProductResponse>[];
    final productsEntity = productsResponse.map((product) => product.toDomain).toList();

    return Products(
      products: productsEntity,
      total: this?.total ?? 0,
      skip: this?.skip ?? 0,
      limit: this?.limit ?? 0
    );
  }
}