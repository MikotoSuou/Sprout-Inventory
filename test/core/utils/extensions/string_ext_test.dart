import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_inventory/core/utils/extensions/string_ext.dart';

void main() {
  group('isValidUrl', () {
    test('should return true for valid URLs', () {
      // Arrange
      const url = 'https://example.com';
      const expected = true;

      // Act
      final result = url.isValidUrl;

      // Assert
      expect(result, expected);
    });

    test('should return false for invalid URLs', () {
      // Arrange
      const url = 'not_a_url';
      const expected = false;

      // Act
      final result = url.isValidUrl;

      // Assert
      expect(result, expected);
    });

    test('should return false for null strings', () {
      // Arrange
      String? url;
      const expected = false;

      // Act
      final result = url.isValidUrl;

      // Assert
      expect(result, expected);
    });
  });
}