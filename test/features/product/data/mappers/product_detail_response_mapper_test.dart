
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_inventory/features/product/data/mappers/product_detail_response_mapper.dart';
import 'package:sprout_inventory/features/product/data/responses/product_detail_response.dart';

import '../../../../fixtures/stub_json/json_constants.dart';
import '../../../../fixtures/stub_json/json_reader.dart';
import '../../../../fixtures/stub_objects/product_detail.dart';

void main() {
  group("toDomain", () {
    test("ProductDetailResponse should be mapped properly to ProductDetail entity", () async {
      final response = ProductDetailResponse.fromJson(json.decode(readJson(Fixtures.productDetailResponse)));
      final result = response.toDomain;
      expect(result, stubProductDetail);
    });
  });
}