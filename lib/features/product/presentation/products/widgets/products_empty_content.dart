
import 'package:flutter/material.dart';
import 'package:sprout_inventory/res/strings.dart';

class ProductsEmptyContent extends StatelessWidget {
  const ProductsEmptyContent({super.key});

  @override
  Widget build(BuildContext context) => const Center(
    child: Text(Strings.noProductsToView)
  );
}
