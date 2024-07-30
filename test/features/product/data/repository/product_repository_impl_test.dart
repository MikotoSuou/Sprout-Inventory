
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retrofit/dio.dart';
import 'package:sprout_inventory/core/error/failure.dart';
import 'package:sprout_inventory/features/product/data/repository/product_repository_impl.dart';
import 'package:sprout_inventory/features/product/data/responses/product_detail_response.dart';
import 'package:sprout_inventory/features/product/data/responses/products_response.dart';
import 'package:sprout_inventory/features/product/domain/repository/product_repository.dart';

import '../../../../core/data_source/remote/api_service_mock.mocks.dart';
import '../../../../core/utils/network_info/network_info_mock.mocks.dart';
import '../../../../fixtures/stub_objects/product_detail.dart';
import '../../../../fixtures/stub_objects/products.dart';


void main() {
  late MockApiService api;
  late MockINetworkInfo networkInfo;
  late IProductRepository repository;

  setUpAll(() {
    api = MockApiService();
    networkInfo = MockINetworkInfo();

    repository = ProductRepositoryImpl(api, networkInfo);
  });

  group('getProducts', () {
    test('should check if the device is online', () async {
      const page = 1;
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => true);

      repository.getProducts(page);

      verify(networkInfo.isNetworkConnected);
    });

    test('should return left with the correct data on successful get products', () async {
      const page = 1;
      final response = HttpResponse<ProductsResponse>(
          stubProductsResponse,
          Response(requestOptions: RequestOptions(), statusCode: 200)
      );
      when(api.productsService(any))
          .thenAnswer((_) async => Future.value(response));

      final result = await repository.getProducts(page);

      expect(result.isLeft(), true);
      expect(result, const Left(stubProducts));
    });

    test('should return right with failure on failed get products', () async {
      const page = 1;
      when(api.productsService(any))
          .thenThrow(const ServerFailure());

      final result = await repository.getProducts(page);

      expect(result.isRight(), true);
      expect(result, const Right(ServerFailure()));
    });
  });

  group('getProductDetail', () {
    test('should check if the device is online', () async {
      const page = 1;
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => true);

      repository.getProducts(page);

      verify(networkInfo.isNetworkConnected);
    });

    test('should return left with the correct data on successful get product detail', () async {
      const id = 1;
      final response = HttpResponse<ProductDetailResponse>(
          stubProductDetailResponse,
          Response(requestOptions: RequestOptions(), statusCode: 200)
      );
      when(api.productDetailService(any))
          .thenAnswer((_) async => Future.value(response));

      final result = await repository.getProductDetail(id);

      expect(result.isLeft(), true);
      expect(result, const Left(stubProductDetail));
    });

    test('should return right with failure on failed get product detail', () async {
      const id = 1;
      when(api.productDetailService(any))
          .thenThrow(const ServerFailure());

      final result = await repository.getProductDetail(id);

      expect(result.isRight(), true);
      expect(result, const Right(ServerFailure()));
    });
  });

}