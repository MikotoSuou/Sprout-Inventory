import 'package:flutter/material.dart';
import 'package:sprout_inventory/core/utils/widgets.dart';
import 'package:sprout_inventory/res/strings.dart';

import '../../../../../res/values.dart' as values;

class ProductSpecifications extends StatelessWidget {
  final String brand;
  final String category;
  final int stock;

  const ProductSpecifications({
    super.key,
    required this.brand,
    required this.category,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        Strings.specifications,
        style: Theme.of(context).textTheme.titleSmall,
      ),

      const Space(height: values.Size.s10),

      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: Strings.brand,
              style: Theme.of(context).textTheme.titleSmall,
            ),

            TextSpan(
              text: " $brand",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),


      const Space(height: values.Size.s10),

      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: Strings.category,
              style: Theme.of(context).textTheme.titleSmall,
            ),

            TextSpan(
              text: " $category",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),

      const Space(height: values.Size.s10),

      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: Strings.stocks,
              style: Theme.of(context).textTheme.titleSmall,
            ),

            TextSpan(
              text: " $stock",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    ],
  );

}
