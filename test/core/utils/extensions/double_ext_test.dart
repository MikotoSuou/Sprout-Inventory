import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_inventory/core/utils/extensions/double_ext.dart';

void main() {
  group('toStringAmount', () {
    test('should format amount correctly', () {
      const amount = 123.45; // Replace with the amount you want to test

      // Expected result with Philippine Peso symbol (₱)
      const expected = '₱123.45';

      // Test the method
      final result = amount.toStringAmount;

      // Verify the result
      expect(result, expected);
    });

    test('should handle null amount', () {
      double? amount; // Test with null amount

      // Expected result should be 0.0 formatted with Philippine Peso symbol (₱)
      const expected = '₱0.00';

      // Test the method
      final result = amount.toStringAmount;

      // Verify the result
      expect(result, expected);
    });
  });
}