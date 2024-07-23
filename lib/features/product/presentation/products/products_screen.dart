import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprout_inventory/core/di/di.dart';
import 'package:sprout_inventory/core/utils/widgets.dart';
import 'package:sprout_inventory/features/product/domain/usecases/get_products_usecase.dart';
import 'package:sprout_inventory/features/product/presentation/products/cubit/products_cubit.dart';
import 'package:sprout_inventory/features/product/presentation/products/widgets/products_content.dart';
import 'package:sprout_inventory/res/strings.dart';

import '../../../../res/values.dart' as values;

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => ProductsCubit(instance<GetProductsUseCase>()),
    child: SafeScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: values.Padding.p16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Space(height: values.Size.s16),

            Align(
              alignment: Alignment.center,
              child: Text(
                Strings.appName,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),

            const Space(height: values.Size.s10),

            const Expanded(child: ProductsContent()),
          ],
        ),
      ),
    ),
  );
}

