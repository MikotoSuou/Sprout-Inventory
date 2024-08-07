import 'package:dartz/dartz.dart';
import 'package:sprout_inventory/core/data_source/remote/api_service.dart';
import 'package:sprout_inventory/core/utils/extensions/response_ext.dart';
import 'package:sprout_inventory/features/product/data/mappers/product_detail_response_mapper.dart';
import 'package:sprout_inventory/features/product/data/mappers/products_response_mapper.dart';
import 'package:sprout_inventory/features/product/domain/repository/product_repository.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/logger.dart';
import '../../../../core/utils/network_info.dart';
import '../../domain/entities/product_detail.dart';
import '../../domain/entities/products.dart';


class ProductRepositoryImpl extends IProductRepository {
  final ApiService _api;
  final INetworkInfo _networkInfo;

  ProductRepositoryImpl(
    this._api,
    this._networkInfo
  );

  @override
  Future<Either<Products, Failure>> getProducts(int page) async {
    if(!await _networkInfo.isNetworkConnected) {
      return const Right(NetworkFailure());
    }

    try {
      final productsResponse = await _api.productsService(page.toString());

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

  @override
  Future<Either<ProductDetail, Failure>> getProductDetail(int productId) async {
    if(!await _networkInfo.isNetworkConnected) {
      return const Right(NetworkFailure());
    }

    try {
      final productDetailResponse = await _api.productDetailService(productId.toString());

      if(productDetailResponse.response.isSuccessful) {
        final productDetailEntity = productDetailResponse.data.toDomain;
        return Left(productDetailEntity);
      } else {
        logger.d("getProductDetail error :: ${productDetailResponse.response.errorMessage}");
        return const Right(ServerFailure());
      }

    } catch (error) {
      logger.e(error);
      return Right(ErrorHandler.handle(error).failure);
    }
  }

}