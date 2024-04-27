import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sprout_inventory/core/navigation/routes.dart';
import 'package:sprout_inventory/core/utils/widgets.dart';
import 'package:sprout_inventory/features/product/domain/entities/product.dart';
import '../../../../../res/colors.dart';
import '../../../../../res/values.dart' as values;


class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => context.push(Routes.productDetail, extra: product.id),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            ImageNetwork(
              url: product.thumbnail,
              height: values.Size.s150,
            ),

            Positioned(
              top: values.Size.s10,
              left: values.Size.s10,
              child: Container(
                width: values.Size.s65,
                padding: const EdgeInsets.symmetric(horizontal: values.Padding.p10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(values.Size.s50),
                  color: ColorManager.red,
                ),
                alignment: Alignment.center,
                child: Text(
                  "-${product.discountPercentage}%",
                  style: Theme.of(context).textTheme.headlineSmall,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),

        Text(
          product.title,
          style: Theme.of(context).textTheme.titleSmall,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),

        Text(
          product.price,
          style: Theme.of(context).textTheme.labelSmall,
          overflow: TextOverflow.ellipsis,
        ),

        Text(
          "Stocks left: ${product.stock}",
          style: Theme.of(context).textTheme.bodySmall,
          overflow: TextOverflow.ellipsis,
        ),

        const Space(height: values.Size.s5),
      ],
    ),
  );
}
