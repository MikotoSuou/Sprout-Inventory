
import 'package:sprout_inventory/core/utils/constants.dart';
import 'package:sprout_inventory/core/utils/extensions/double_ext.dart';
import 'package:sprout_inventory/core/utils/extensions/integer_ext.dart';
import 'package:sprout_inventory/features/product/data/responses/product_detail_response.dart';
import 'package:sprout_inventory/features/product/domain/entities/product_detail.dart';

extension ProductDetailResponseMapper on ProductDetailResponse? {
  ProductDetail get toDomain {
    final discountPercentageEntity = this?.discountPercentage ?? 0.0;
    final originalPrice = this?.price ?? 0;
    final discountedPrice = originalPrice.lessDiscountPercentage(discountPercentageEntity);

    return ProductDetail(
      id: this?.id ?? 0,
      title: this?.title ?? Constants.emptyString,
      description: this?.description ?? Constants.emptyString,
      originalPrice: originalPrice.toStringAmount,
      discountedPrice: discountedPrice.toStringAmount,
      discountPercentage: discountPercentageEntity,
      rating: this?.rating ?? 0.0,
      stock: this?.stock ?? 0,
      brand: this?.brand ?? Constants.emptyString,
      category: this?.category ?? Constants.emptyString,
      thumbnail: this?.thumbnail ?? Constants.emptyString,
      images: this?.images ?? <String>[]
    );
  }
}