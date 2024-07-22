
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sprout_inventory/core/utils/widgets.dart';
import 'package:sprout_inventory/features/product/presentation/product_detail/cubit/product_detail_cubit.dart';
import '../../../../../../res/colors.dart';
import '../../../../../res/values.dart' as values;

class ProductDetailAppBar extends StatelessWidget {
  const ProductDetailAppBar({super.key});

  ShapeBorder get _borderRadius => const ContinuousRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(values.Size.s18),
      bottomRight: Radius.circular(values.Size.s18),
    ),
  );

  @override
  Widget build(BuildContext context) => SliverAppBar(
    backgroundColor: ColorManager.primary,
    expandedHeight: values.Size.s250,
    floating: true,
    pinned: true,
    centerTitle: true,
    clipBehavior: Clip.antiAlias,
    flexibleSpace: BlocBuilder<ProductDetailCubit, ProductDetailState>(
      builder: (context, state) => state.maybeWhen(
        loading: () => _loading(),
        loaded: (productDetail) => _thumbnail(productDetail.thumbnail),
        orElse: () => const SizedBox.shrink()
      ),
    ),
    shape: _borderRadius,
    leading: _backButton(context),
  );

  Widget _loading() => const Center(child: CircularProgressIndicator(color: ColorManager.white, strokeWidth: values.Size.s2));
  
  Widget _thumbnail(String thumbnail) => FlexibleSpaceBar(
    background: ImageNetwork(url: thumbnail),
  );
  
  Widget _backButton(BuildContext context) => IconButton(
    onPressed: () => context.pop(),
    icon: const Icon(Icons.keyboard_backspace, color: ColorManager.black),
    style: IconButton.styleFrom(backgroundColor: ColorManager.white),
  );

}
