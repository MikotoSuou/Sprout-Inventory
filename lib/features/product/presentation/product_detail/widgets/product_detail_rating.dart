import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sprout_inventory/core/utils/widgets.dart';
import 'package:sprout_inventory/res/strings.dart';

import '../../../../../res/values.dart' as values;

class ProductDetailRating extends StatelessWidget {
  final double rating;

  const ProductDetailRating({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      RatingBar.builder(
        ignoreGestures: true,
        itemSize: 20,
        initialRating: rating,
        minRating: 0,
        direction: Axis.horizontal,
        allowHalfRating: true,
        unratedColor: Colors.grey,
        itemCount: 5,
        itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
        onRatingUpdate: (_) {},
      ),

      const Space(width: values.Size.s10),

      Text(
        "$rating ${Strings.rating}",
        style: Theme.of(context).textTheme.displaySmall,
      ),
    ],
  );
  


}
