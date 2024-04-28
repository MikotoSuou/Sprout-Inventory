
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_inventory/features/product/data/responses/product_response.dart';

import '../../../../fixtures/stub_json/json_constants.dart';
import '../../../../fixtures/stub_json/json_reader.dart';
import '../../../../fixtures/stub_objects/product.dart';


void main() {

  group("fromJson", () {
    test("should return a valid ProductResponse from JSON", () async {
      final Map<String, dynamic> jsonMap = json.decode(readJson(Fixtures.productResponse));
      final result = ProductResponse.fromJson(jsonMap);
      expect(result, stubProductResponse);
    });
  });

  group("toJson", () {
    test("should return a valid ProductResponse JSON", () async {
      final Map<String, dynamic> expectedJsonMap = json.decode(readJson(Fixtures.productResponse));
      final result = stubProductResponse.toJson();
      expect(result, expectedJsonMap);
    });
  });

}