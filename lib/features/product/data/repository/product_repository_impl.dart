import 'package:dartz/dartz.dart';
import 'package:sprout_inventory/core/utils/extensions/response_ext.dart';
import 'package:sprout_inventory/features/product/data/data_source/products_data_source.dart';
import 'package:sprout_inventory/features/product/data/mappers/products_response_mapper.dart';
import 'package:sprout_inventory/features/product/domain/repository/product_repository.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../../../core/utils/network_info.dart';
import '../../domain/entities/products.dart';


class ProductRepositoryImpl extends IProductRepository {
  final IProductRemoteDataSource _productRemoteDataSource;
  final INetworkInfo _networkInfo;

  ProductRepositoryImpl(
    this._productRemoteDataSource,
    this._networkInfo
  );

  @override
  Future<Either<Products, Failure>> getProducts(int page) async {
    if(!await _networkInfo.isNetworkConnected) {
      return const Right(NetworkFailure());
    }

    try {
      final productsResponse = await _productRemoteDataSource.products(page.toString());

      if(productsResponse.response.isSuccessful) {
        final productsEntity = productsResponse.data.toDomain;
        return Left(productsEntity);
      } else {
        logger.d("getProducts error :: ${productsResponse.response.errorMessage}");
        return const Right(ServerFailure());
      }

    } catch (error) {
      logger.e(error);
      return Right(ErrorHandler.handle(error).failure);
    }
  }

}