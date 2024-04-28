
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_inventory/features/product/data/responses/products_response.dart';

import '../../../../fixtures/stub_json/json_constants.dart';
import '../../../../fixtures/stub_json/json_reader.dart';
import '../../../../fixtures/stub_objects/products.dart';


void main() {

  group("fromJson", () {
    test("should return a valid ProductsResponse from JSON", () async {
      final Map<String, dynamic> jsonMap = json.decode(readJson(Fixtures.productsResponse));
      final result = ProductsResponse.fromJson(jsonMap);
      expect(result, stubProductsResponse);
    });
  });

  group("toJson", () {
    test("should return a valid ProductsResponse JSON", () async {
      final Map<String, dynamic> expectedJsonMap = json.decode(readJson(Fixtures.productsResponse));
      final result = stubProductsResponse.toJson();
      expect(result, expectedJsonMap);
    });
  });

}