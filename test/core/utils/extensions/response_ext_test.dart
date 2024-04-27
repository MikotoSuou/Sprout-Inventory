import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_inventory/core/error/error_handler.dart';
import 'package:sprout_inventory/core/utils/extensions/response_ext.dart';

void main() {
  group('optString', () {
    test('optString should return string representation when Response is not null', () {
      // Arrange
      final response = Response(data: 'test', requestOptions: RequestOptions());
      const expected = 'test';

      // Act
      final result = response.optString;

      // Assert
      expect(result, expected);
    });

    test('optString should return empty string when Response is null', () {
      // Arrange
      Response? response;
      const expected = '';

      // Act
      final result = response.optString;

      // Assert
      expect(result, expected);
    });
  });


  group('isSuccessful', () {
    test('should return true when Response is successful', () {
      // Arrange
      final response = Response(statusCode: 200, requestOptions: RequestOptions());

      // Act
      final result = response.isSuccessful;

      // Assert
      expect(result, true);
    });

    test('should return false when Response is not successful', () {
      // Arrange
      final response = Response(statusCode: 404, requestOptions: RequestOptions());

      // Act
      final result = response.isSuccessful;

      // Assert
      expect(result, false);
    });

    test('should return false when Response is null', () {
      // Arrange
      Response? response;

      // Act
      final result = response.isSuccessful;

      // Assert
      expect(result, false);
    });
  });

  group('errorMessage', () {
    test('should return status message when Response is not null', () {
      // Arrange
      final response = Response(statusMessage: 'Error message', requestOptions: RequestOptions());
      const expected = 'Error message';

      // Act
      final result = response.errorMessage;

      // Assert
      expect(result, expected);
    });

    test('should return unknown message when Response and status message are null', () {
      // Arrange
      Response? response;
      const expected = ResponseMessage.unknown;

      // Act
      final result = response.errorMessage;

      // Assert
      expect(result, expected);
    });

    test('should return status message when Response is not null but status message is null', () {
      // Arrange
      final response = Response(statusMessage: null, requestOptions: RequestOptions());
      const expected = ResponseMessage.unknown;

      // Act
      final result = response.errorMessage;

      // Assert
      expect(result, expected);
    });
  });
}