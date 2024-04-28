
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_inventory/features/product/data/mappers/products_response_mapper.dart';
import 'package:sprout_inventory/features/product/data/responses/products_response.dart';

import '../../../../fixtures/stub_json/json_constants.dart';
import '../../../../fixtures/stub_json/json_reader.dart';
import '../../../../fixtures/stub_objects/products.dart';

void main() {
  group("toDomain", () {
    test("ProductsResponse should be mapped properly to Products entity", () async {
      final response = ProductsResponse.fromJson(json.decode(readJson(Fixtures.productsResponse)));
      final result = response.toDomain;
      expect(result, stubProducts);
    });
  });
}