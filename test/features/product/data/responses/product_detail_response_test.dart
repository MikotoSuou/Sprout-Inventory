
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_inventory/features/product/data/responses/product_detail_response.dart';

import '../../../../fixtures/stub_json/json_constants.dart';
import '../../../../fixtures/stub_json/json_reader.dart';
import '../../../../fixtures/stub_objects/product_detail.dart';


void main() {

  group("fromJson", () {
    test("should return a valid ProductDetailResponse from JSON", () async {
      final Map<String, dynamic> jsonMap = json.decode(readJson(Fixtures.productDetailResponse));
      final result = ProductDetailResponse.fromJson(jsonMap);
      expect(result, stubProductDetailResponse);
    });
  });

  group("toJson", () {
    test("should return a valid ProductDetailResponse response JSON", () async {
      final Map<String, dynamic> expectedJsonMap = json.decode(readJson(Fixtures.productDetailResponse));
      final result = stubProductDetailResponse.toJson();
      expect(result, expectedJsonMap);
    });
  });

}