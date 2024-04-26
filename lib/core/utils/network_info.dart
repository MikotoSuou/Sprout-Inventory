import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class INetworkInfo {
  Future<bool> get isNetworkConnected;
  Stream<InternetConnectionStatus> get onStatusChanged;
}

class NetworkInfoImpl implements INetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;

  NetworkInfoImpl(this._internetConnectionChecker);

  @override
  Future<bool> get isNetworkConnected => _internetConnectionChecker.hasConnection;

  @override
  Stream<InternetConnectionStatus> get onStatusChanged => _internetConnectionChecker.onStatusChange;
}