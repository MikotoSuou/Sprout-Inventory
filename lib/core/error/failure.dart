import 'package:equatable/equatable.dart';
import 'error_handler.dart';

sealed class Failure extends Equatable {
  final String message;
  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = ResponseMessage.noInternetConnection});
}

class ServerFailure extends Failure {
  const ServerFailure({super.message = ResponseMessage.serverError});
}