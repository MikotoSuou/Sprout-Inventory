
import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';

import 'network_info_mock.mocks.dart';

void main() {
  late MockINetworkInfo networkInfo;

  setUp(() {
    networkInfo = MockINetworkInfo();
  });

  group("networkInfo", () {
    test("isNetworkConnected when network is connected should return true", () async {
      when(networkInfo.isNetworkConnected)
          .thenAnswer((_) async => true);

      final result = await networkInfo.isNetworkConnected;

      verify(networkInfo.isNetworkConnected);
      expect(result, isTrue);
    });

    test("isNetworkConnected when network is not connected should return false", () async {
      when(networkInfo.isNetworkConnected)
          .thenAnswer((_) async => false);

      final result = await networkInfo.isNetworkConnected;

      verify(networkInfo.isNetworkConnected);
      expect(result, isFalse);
    });

    test('onStatusChanged should emit correct InternetConnectionStatus events', () {
      // Arrange
      final streamController = StreamController<InternetConnectionStatus>();
      final expectedEvents = [InternetConnectionStatus.connected, InternetConnectionStatus.disconnected];

      // Act
      when(networkInfo.onStatusChanged).thenAnswer((_) => streamController.stream);

      // Assert
      expect(networkInfo.onStatusChanged, emitsInOrder(expectedEvents));

      // Simulate events
      streamController.add(InternetConnectionStatus.connected);
      streamController.add(InternetConnectionStatus.disconnected);
      streamController.close();
    });
  });
}