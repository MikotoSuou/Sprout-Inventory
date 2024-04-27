import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprout_inventory/core/utils/helpers.dart';
import 'package:sprout_inventory/core/utils/logger.dart';
import 'package:sprout_inventory/core/utils/widgets.dart';
import 'package:sprout_inventory/features/product/domain/entities/product_detail.dart';
import 'package:sprout_inventory/features/product/presentation/product_detail/blocs/product_detail_bloc.dart';
import 'package:sprout_inventory/features/product/presentation/product_detail/widgets/product_detail_desc.dart';
import 'package:sprout_inventory/features/product/presentation/product_detail/widgets/product_detail_images.dart';
import 'package:sprout_inventory/features/product/presentation/product_detail/widgets/product_detail_price.dart';
import 'package:sprout_inventory/features/product/presentation/product_detail/widgets/product_detail_rating.dart';
import 'package:sprout_inventory/features/product/presentation/product_detail/widgets/product_detail_specs.dart';

import '../../../../../res/values.dart' as values;

class ProductDetailContent extends StatelessWidget {
  const ProductDetailContent({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(
      vertical: values.Padding.p20,
      horizontal: values.Padding.p16,
    ),
    child: BlocConsumer<ProductDetailBloc, ProductDetailState>(
      listener: (context, state) {
        if(state is ProductDetailLoadFailed) {
          logger.d(" failed");
          showErrorSnackBar(context, error: state.error);
        }
      },
      builder: (context, state) => switch (state) {
        ProductDetailLoading() => _buildLoading(context),
        ProductDetailLoaded() => _buildProductDetails(state.productDetail),
        _ => const SizedBox.shrink(),
      },
    ),
  );


  Widget _buildLoading(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const ShimmerWidget(height: values.Size.s70),

      const Space(height: values.Size.s5),

      ShimmerWidget(width: MediaQuery.sizeOf(context).width * 0.45, height: values.Size.s16),

      const Space(height: values.Size.s20),

      const ShimmerWidget(height: values.Size.s90),

      const Space(height: values.Size.s20),

      const ShimmerWidget(height: values.Size.s50),

      const Space(height: values.Size.s10),

      ShimmerWidget(width: MediaQuery.sizeOf(context).width * 0.35, height: values.Size.s16),

      const Space(height: values.Size.s10),

      ShimmerWidget(width: MediaQuery.sizeOf(context).width * 0.25, height: values.Size.s16),

      const Space(height: values.Size.s20),

      const ShimmerWidget(height: values.Size.s250)
    ],
  );

  Widget _buildProductDetails(ProductDetail product) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ProductDetailPrice(
        discount: product.discountPercentage,
        discountedPrice: product.discountedPrice,
        originalPrice: product.originalPrice,
      ),

      const Space(height: values.Size.s5),

      ProductDetailRating(rating: product.rating),

      const Space(height: values.Size.s20),

      ProductDescription(
        title: product.title,
        description: product.description,
      ),

      const Space(height: values.Size.s20),

      ProductSpecifications(
        brand: product.brand,
        category: product.category,
        stock: product.stock,
      ),

      const Space(height: values.Size.s20),

      ProductDetailImages(images: product.images),
    ],
  );

}
