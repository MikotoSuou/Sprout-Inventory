
import 'package:sprout_inventory/core/utils/constants.dart';
import 'package:sprout_inventory/core/utils/extensions/integer_ext.dart';
import 'package:sprout_inventory/features/product/data/responses/product_response.dart';
import 'package:sprout_inventory/features/product/domain/entities/product.dart';

extension ProductResponseMapper on ProductResponse? {
  Product get toDomain => Product(
    id: this?.id ?? 0,
    title: this?.title ?? Constants.emptyString,
    price: (this?.price ?? 0).toStringAmount,
    thumbnail: this?.thumbnail ?? Constants.emptyString,
    stock: this?.stock ?? 0,
    discountPercentage: this?.discountPercentage ?? 0.0,
  );
}