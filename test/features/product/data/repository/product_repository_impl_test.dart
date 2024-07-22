

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retrofit/dio.dart';
import 'package:sprout_inventory/core/error/error_handler.dart';
import 'package:sprout_inventory/core/error/failure.dart';
import 'package:sprout_inventory/features/product/data/repository/product_repository_impl.dart';
import 'package:sprout_inventory/features/product/data/responses/product_detail_response.dart';
import 'package:sprout_inventory/features/product/data/responses/products_response.dart';
import 'package:sprout_inventory/features/product/domain/repository/product_repository.dart';

import '../../../../core/utils/network_info/network_info_mock.mocks.dart';
import '../../../../fixtures/stub_objects/product_detail.dart';
import '../../../../fixtures/stub_objects/products.dart';
import '../data_source/products_data_source_mock.mocks.dart';


void main() {
  late MockIProductRemoteDataSource dataSource;
  late MockINetworkInfo networkInfo;
  late IProductRepository repository;

  setUpAll(() {
    dataSource = MockIProductRemoteDataSource();
    networkInfo = MockINetworkInfo();

    repository = ProductRepositoryImpl(dataSource, networkInfo);
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(networkInfo.isNetworkConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  group('getProducts', () {
    test('should check if the device is online', () async {
      // arrange
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => true);

      // act
      repository.getProducts(stubProductsParam);

      // assert
      verify(networkInfo.isNetworkConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        // arrange
        final response = HttpResponse<ProductsResponse>(
            stubProductsResponse,
            Response(requestOptions: RequestOptions(), statusCode: 200)
        );
        when(dataSource.products(any))
            .thenAnswer((_) async => Future.value(response));

        // act
        final result = await repository.getProducts(stubProductsParam);

        // assert
        verify(dataSource.products(stubProductsRequest));
        expect(result, equals(const Left(stubProducts)));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        // arrange
        when(dataSource.products(any))
            .thenThrow(const ServerFailure());

        // act
        final result = await repository.getProducts(stubProductsParam);

        // assert
        verify(dataSource.products(stubProductsRequest));
        expect(result, equals(const Right(ServerFailure())));
      });
    });
  });


  group('getProductDetail', () {
    test('should check if the device is online', () async {
      // arrange
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => true);

      // act
      repository.getProductDetail(stubProductDetailParam);

      // assert
      verify(networkInfo.isNetworkConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        // arrange
        final response = HttpResponse<ProductDetailResponse>(
            stubProductDetailResponse,
            Response(requestOptions: RequestOptions(), statusCode: 200)
        );
        when(dataSource.productDetail(stubProductDetailRequest))
            .thenAnswer((_) async => Future.value(response));

        // act
        final result = await repository.getProductDetail(stubProductDetailParam);

        // assert
        verify(dataSource.productDetail(stubProductDetailRequest));
        expect(result, equals(const Left(stubProductDetail)));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        // arrange
        when(dataSource.productDetail(any))
            .thenThrow(const ServerFailure());

        // act
        final result = await repository.getProductDetail(stubProductDetailParam);

        // assert
        verify(dataSource.productDetail(stubProductDetailRequest));
        expect(result, equals(const Right(ServerFailure())));
      });
    });
  });

}