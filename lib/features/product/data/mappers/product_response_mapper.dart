
import 'package:intl/intl.dart';
import 'package:sprout_inventory/core/utils/constants.dart';
import 'package:sprout_inventory/features/product/data/responses/product_response.dart';
import 'package:sprout_inventory/features/product/domain/entities/product.dart';

extension ProductResponseMapper on ProductResponse? {
  Product get toDomain {
    final formatter = NumberFormat.simpleCurrency(locale: "en_US");
    final priceEntity = this?.price ?? 0;
    final parsedPrice = formatter.format(priceEntity);

    return Product(
      id: this?.id ?? 0,
      title: this?.title ?? Constants.emptyString,
      price: parsedPrice,
      thumbnail: this?.title ?? Constants.emptyString,
      stock: this?.stock ?? 0,
      discountPercentage: this?.discountPercentage ?? 0.0,
    );
  }
}