
import 'package:dartz/dartz.dart';
import 'package:sprout_inventory/features/product/domain/entities/product_detail.dart';
import 'package:sprout_inventory/features/product/domain/entities/products.dart';
import '../../../../core/error/failure.dart';

abstract class IProductRepository {
  Future<Either<Products, Failure>> getProducts(int page);
  Future<Either<ProductDetail, Failure>> getProductDetail(int productId);
}