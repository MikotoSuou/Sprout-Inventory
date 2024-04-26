import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sprout_inventory/core/utils/widgets.dart';

import '../../../../res/colors.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  @override
  Widget build(BuildContext context) => SafeScaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Sprout Inventory",
            style: Theme.of(context).textTheme.displayLarge,
          ),

          Space(height: 10),

          // child: AlignedGridView.count(
          //   physics: const NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   padding: padding,
          //   crossAxisCount: crossAxisCount,
          //   crossAxisSpacing: values.Size.s12,
          //   mainAxisSpacing: values.Size.s5,
          //   itemCount: itemCount,
          //   itemBuilder: (context, index) => ShimmerWidget(height: height),
          // ),

          // MediaQuery.removePadding(
          //   context: context,
          //   removeTop: true,
          //   removeBottom: true,
          //   child: AlignedGridView.count(
          //     physics: const NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     crossAxisCount: 2,
          //     crossAxisSpacing: values.Size.s10,
          //     mainAxisSpacing: values.Size.s10,
          //     itemCount: state.browseServices.services.length,
          //     itemBuilder: (context, index) => HomeBrowseServiceCard(service: state.browseServices.services[index]),
          //   ),
          // ),

          Expanded(
            child: MasonryGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              itemCount: 10,
              itemBuilder: (context, index) => testCard,
            ),
          ),


        ],
      ),
    ),
  );


  Widget get testCard => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Stack(
        children: [
          ImageNetwork(url: "https://cdn.dummyjson.com/product-images/2/thumbnail.jpg"),

          Positioned(
            top: 10,
            left: 10,
            child: Container(
              width: 65,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: ColorManager.red,
              ),
              alignment: Alignment.center,
              child: Text(
                "-99.99%",
                style: Theme.of(context).textTheme.headlineSmall,
                overflow: TextOverflow.clip,
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),

      Text(
        "Samsung Universe 9",
        style: Theme.of(context).textTheme.titleSmall,
      ),

      Text(
        "₱ 1249",
        style: Theme.of(context).textTheme.labelSmall,
      ),

      Text(
        "Stocks left: 36",
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ],
  );
}
