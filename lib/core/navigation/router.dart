
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sprout_inventory/core/navigation/routes.dart';
import 'package:sprout_inventory/features/product/presentation/product_detail/product_detail_screen.dart';
import 'package:sprout_inventory/features/product/presentation/products/products_screen.dart';

import '../utils/logger.dart';


final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.products,
    routes: [

      // products route
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: Routes.products,
        pageBuilder: (context, state) {
          // initMaintenanceDependencies();
          return AppTransition.none(state: state, child: const ProductsScreen());
        }
      ),

      // product detail route
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: Routes.productDetail,
        pageBuilder: (context, state) => AppTransition.slide(state: state, child: const ProductDetailScreen()),
      ),

    ],
    redirect: (context, state) {
      logger.d("route location :: ${state.matchedLocation}");
      return null;
    }
);


class AppTransition {

  static NoTransitionPage none({
    required GoRouterState state,
    required Widget child
  }) => NoTransitionPage(
    key: state.pageKey,
    child: child,
  );

  static CustomTransitionPage slide({
    required GoRouterState state,
    required Widget child
  }) => CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );

}