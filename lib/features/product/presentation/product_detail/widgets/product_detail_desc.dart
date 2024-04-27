import 'package:flutter/material.dart';
import 'package:sprout_inventory/core/utils/widgets.dart';
import 'package:sprout_inventory/res/strings.dart';

import '../../../../../res/values.dart' as values;

class ProductDescription extends StatelessWidget {
  final String title;
  final String description;

  const ProductDescription({
    super.key,
    required this.title,
    required this.description
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        Strings.productDetails,
        style: Theme.of(context).textTheme.titleSmall,
      ),

      const Space(height: values.Size.s10),

      Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),

      Text(
        description,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ],
  );

}
