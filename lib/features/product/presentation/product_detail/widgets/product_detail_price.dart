import 'package:flutter/material.dart';
import 'package:sprout_inventory/core/utils/widgets.dart';
import 'package:sprout_inventory/res/strings.dart';

import '../../../../../res/colors.dart';
import '../../../../../res/values.dart' as values;

class ProductDetailPrice extends StatelessWidget {
  final double discount;
  final String discountedPrice;
  final String originalPrice;

  const ProductDetailPrice({
    super.key,
    required this.discount,
    required this.discountedPrice,
    required this.originalPrice,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(values.Padding.p12),
    decoration: BoxDecoration(
      color: ColorManager.veryLightGrey,
      borderRadius: BorderRadius.circular(values.Size.s8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.discountedPrice,
              style: Theme.of(context).textTheme.titleSmall,
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: values.Padding.p10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(values.Size.s50),
                color: ColorManager.red,
              ),
              alignment: Alignment.center,
              child: Text(
                "-$discount%",
                style: Theme.of(context).textTheme.headlineSmall,
                overflow: TextOverflow.clip,
                maxLines: 1,
              ),
            ),
          ],
        ),

        Row(
          children: [
            Text(
              discountedPrice,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const Space(width: values.Size.s10),

            Text(
              originalPrice,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: ColorManager.grey
              ),
            ),
          ],
        ),
      ],
    ),
  );

}
