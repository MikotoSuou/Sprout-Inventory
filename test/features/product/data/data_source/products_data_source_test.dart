
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sprout_inventory/features/product/data/data_source/products_data_source.dart';
import 'package:sprout_inventory/features/product/data/responses/product_detail_response.dart';
import 'package:sprout_inventory/features/product/data/responses/products_response.dart';

import '../../../../core/data_source/remote/api_service_mock.mocks.dart';
import '../../../../fixtures/stub_json/json_constants.dart';
import '../../../../fixtures/stub_json/json_reader.dart';
import '../../../../fixtures/stub_objects/product_detail.dart';
import '../../../../fixtures/stub_objects/products.dart';

void main() {
  late MockApiService apiService;
  late IProductRemoteDataSource dataSource;

  setUp(() {
    apiService = MockApiService();
    dataSource = ProductRemoteDataSourceImpl(apiService);
  });

  void setUpProductsService() {
    final data = ProductsResponse.fromJson(json.decode(readJson(Fixtures.productsResponse)));
    final response = Response(requestOptions: RequestOptions(), statusCode: 200);
    final productsResponse = Future.value(HttpResponse<ProductsResponse>(data, response));

    when(apiService.productsService(any))
        .thenAnswer((_) async => productsResponse);
  }

  void setUpProductDetailService() {
    final data = ProductDetailResponse.fromJson(json.decode(readJson(Fixtures.productDetailResponse)));
    final response = Response(requestOptions: RequestOptions(), statusCode: 200);
    final productDetailResponse = Future.value(HttpResponse<ProductDetailResponse>(data, response));

    when(apiService.productDetailService(any))
        .thenAnswer((_) async => productDetailResponse);
  }

  group('products', () {
    test('should perform a GET request on a URL with page number as parameter', () async {
      // arrange
      setUpProductsService();

      // act
      dataSource.products(stubProductsRequest);

      // assert
      verify(apiService.productsService(stubProductsRequest));
    });

    test('should return ProductsResponse when the response code is 200 (success)', () async {
      // arrange
      setUpProductsService();

      // act
      final result = await dataSource.products(stubProductsRequest);

      // assert
      expect(result.data, equals(stubProductsResponse));
    });

  });


  group('productDetail', () {
    test('should perform a GET request on a URL with product id as parameter', () async {
      // arrange
      setUpProductDetailService();

      // act
      dataSource.productDetail(stubProductDetailRequest);

      // assert
      verify(apiService.productDetailService(stubProductDetailRequest));
    });

    test('should return ProductDetailResponse when the response code is 200 (success)', () async {
      // arrange
      setUpProductDetailService();

      // act
      final result = await dataSource.productDetail(stubProductDetailRequest);

      // assert
      expect(result.data, equals(stubProductDetailResponse));
    });
  });

}