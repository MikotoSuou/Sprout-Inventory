import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_inventory/core/utils/helpers.dart';

void main() {
  group('randomHeight', () {
    test('should return a value within the expected range', () {
      // Arrange
      const minHeight = 150;
      const maxHeight = 400;

      // Act
      final result = randomHeight;

      // Assert
      expect(result, greaterThanOrEqualTo(minHeight));
      expect(result, lessThanOrEqualTo(maxHeight));
    });
  });
}