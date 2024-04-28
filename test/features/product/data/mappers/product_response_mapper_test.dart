
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_inventory/features/product/data/mappers/product_response_mapper.dart';
import 'package:sprout_inventory/features/product/data/responses/product_response.dart';

import '../../../../fixtures/stub_json/json_constants.dart';
import '../../../../fixtures/stub_json/json_reader.dart';
import '../../../../fixtures/stub_objects/product.dart';

void main() {
  group("toDomain", () {
    test("ProductResponse should be mapped properly to Product entity", () async {
      final response = ProductResponse.fromJson(json.decode(readJson(Fixtures.productResponse)));
      final result = response.toDomain;
      expect(result, stubProduct);
    });
  });
}