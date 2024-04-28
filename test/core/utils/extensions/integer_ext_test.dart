import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_inventory/core/utils/extensions/integer_ext.dart';

void main() {
  group('toStringAmount', () {
    test('should format amount correctly', () {
      // Arrange
      const amount = 123;
      const expected = '₱123.00';

      // Act
      final result = amount.toStringAmount;

      // Assert
      expect(result, expected);
    });

    test('should handle null amount', () {
      // Arrange
      int? amount;
      const expected = '₱0.00';

      // Act
      final result = amount.toStringAmount;

      // Assert
      expect(result, expected);
    });
  });

  group('lessDiscountPercentage', () {
    test('should format amount correctly', () {
      // Arrange
      const amount = 100;
      const percentage = 10.3;
      const expected = 89.7;

      // Act
      final result = amount.lessDiscountPercentage(percentage);

      // Assert
      expect(result, expected);
    });

    test('should handle null amount', () {
      // Arrange
      int? amount;
      const percentage = 10.0;
      const expected = 0.0;

      // Act
      final result = amount.lessDiscountPercentage(percentage);

      // Assert
      expect(result, expected);
    });
  });
}