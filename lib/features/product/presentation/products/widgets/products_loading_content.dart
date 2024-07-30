
import 'package:flutter/material.dart';
import 'package:sprout_inventory/core/utils/widgets.dart';
import 'package:sprout_inventory/res/values.dart' as values;

class ProductsLoadingContent extends StatelessWidget {
  const ProductsLoadingContent({super.key});

  @override
  Widget build(BuildContext context) => const Align(
    alignment: Alignment.topCenter,
    child: Row(
      children: [
        Expanded(child: ShimmerWidget(height: values.Size.s180)),

        Space(width: values.Size.s10),

        Expanded(child: ShimmerWidget(height: values.Size.s180))
      ],
    ),
  );
}
