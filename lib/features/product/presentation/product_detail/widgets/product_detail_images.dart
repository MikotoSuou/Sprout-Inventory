

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sprout_inventory/core/utils/helpers.dart';
import 'package:sprout_inventory/core/utils/widgets.dart';
import '../../../../../res/strings.dart';
import '../../../../../res/values.dart' as values;


// class ProductDetailImages extends StatelessWidget {
//   const ProductDetailImages({super.key});
//
//   @override
//   Widget build(BuildContext context) => SizedBox(
//     height: values.Size.s300,
//     child: ListView.separated(
//       scrollDirection: Axis.horizontal,
//       shrinkWrap: true,
//       padding: const EdgeInsets.symmetric(horizontal: values.Padding.p16),
//       separatorBuilder: (context, index) => const Space(width: values.Size.s10),
//       itemCount: 3,
//       itemBuilder: (context, index) => ClipRRect(
//         borderRadius: BorderRadius.circular(values.Size.s8),
//         child: ImageNetwork(
//           url: "https://cdn.dummyjson.com/product-images/99/4.jpg",
//           width: MediaQuery.sizeOf(context).width * 0.75,
//         ),
//       ),
//     ),
//   );
// }


class ProductDetailImages extends StatelessWidget {
  final List<String> images;

  const ProductDetailImages({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        Strings.images,
        style: Theme.of(context).textTheme.titleSmall,
      ),

      const Space(height: values.Size.s3),

      MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: MasonryGridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          itemCount: images.length,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(values.Size.s8),
            child: ImageNetwork(
              url: images[index],
              height: randomHeight,
            ),
          ),
        ),
      ),
    ],
  );

}
