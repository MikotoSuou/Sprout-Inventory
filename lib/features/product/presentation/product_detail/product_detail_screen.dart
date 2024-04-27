import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprout_inventory/features/product/domain/usecases/get_product_detail_usecase.dart';
import 'package:sprout_inventory/features/product/presentation/product_detail/blocs/product_detail_bloc.dart';
import 'package:sprout_inventory/features/product/presentation/product_detail/widgets/product_detail_appbar.dart';
import 'package:sprout_inventory/features/product/presentation/product_detail/widgets/product_detail_content.dart';

import '../../../../core/di/di.dart';
import '../../../../res/colors.dart';


class ProductDetailScreen extends StatelessWidget {
  final int productId;

  const ProductDetailScreen({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => ProductDetailBloc(instance<GetProductDetailUseCase>())
      ..add(GetProductDetail(productId: productId)),
    child: Container(
      color: ColorManager.white,
      child: const CustomScrollView(
        slivers: [
          ProductDetailAppBar(),
          SliverToBoxAdapter(child: ProductDetailContent()),
        ],
      ),
    ),
  );
}
