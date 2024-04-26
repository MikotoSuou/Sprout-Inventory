import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:sprout_inventory/core/utils/extensions/response_ext.dart';
import '../utils/logger.dart';
import 'dio_error_response.dart';
import 'failure.dart';

enum Status {
  success,
  noContent,
  badRequest,
  internalServerError,
  unauthorized,
  unknown,
  connectTimeout,
  canceled,
  receiveTimeout,
  sendTimeout,
  noInternetConnection
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if(error is DioException) {
      failure = _handleError(error);
    } else if (error is Status) {
      failure = error.failedStatus;
    } else {
      failure = Status.unknown.failedStatus;
    }

    logger.d(failure.message);
  }

  Failure _handleError(DioException error) {
    try {
      final dioError = DioErrorResponse.fromJson(jsonDecode(error.response.optString));
      String? errorMessage;

      if(dioError.error != null) {
        errorMessage = dioError.error;
      } else if (dioError.detail != null) {
        errorMessage = dioError.detail;
      } else if (dioError.message != null ) {
        errorMessage = dioError.message;
      }

      errorMessage ??= ResponseMessage.unknown;
      return ServerFailure(message: errorMessage);

    } catch (_) {
      switch(error.type) {
        case DioExceptionType.connectionTimeout:
          return Status.connectTimeout.failedStatus;

        case DioExceptionType.sendTimeout:
          return Status.sendTimeout.failedStatus;

        case DioExceptionType.receiveTimeout:
          return Status.receiveTimeout.failedStatus;

        case DioExceptionType.badCertificate:
          return Status.unknown.failedStatus;

        case DioExceptionType.badResponse:
          switch(error.response!.statusCode) {
            case ResponseCode.badRequest:
              return Status.badRequest.failedStatus;

            case ResponseCode.internalServerError:
              return Status.internalServerError.failedStatus;

            case ResponseCode.unauthorized:
              return Status.unauthorized.failedStatus;

            default:
              return Status.unknown.failedStatus;
          }

        case DioExceptionType.cancel:
          return Status.canceled.failedStatus;

        case DioExceptionType.connectionError:
          return Status.connectTimeout.failedStatus;

        case DioExceptionType.unknown:
          return Status.unknown.failedStatus;
      }
    }
  }
}

class ResponseCode {
  // API status codes
  static const int success = 200;
  static const int noContent = 204;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int internalServerError = 500;

  // Local status codes
  static const int unknown = -1;
  static const int connectTimeout = -2;
  static const int canceled = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int noInternetConnection = -6;
}

class ResponseMessage {
  // API status messages
  static const String success = "success";
  static const String noContent = "success but no data received";
  static const String badRequest = "Bad requests, please try again later";
  static const String serverError = "Something went wrong, please try again later";
  static const String unauthorized = "Unauthorized user, please try again later";

  // Local status messages
  static const String unknown = "Something went wrong, please try again later";
  static const String connectTimeout = "Connection timeout, please try again later";
  static const String canceled = "Request was canceled, please try again later";
  static const String receiveTimeout = "Connection timeout, please try again later";
  static const String sendTimeout = "Connection timeout, please try again later";
  static const String cacheError = "No cached data, try to retrieve data from network";
  static const String noInternetConnection = "Please check your internet connection";
}

extension StatusExtension on Status {
  Failure get failedStatus {
    switch(this) {
      case Status.badRequest:
        return const ServerFailure(message: ResponseMessage.badRequest);
      case Status.internalServerError:
        return const ServerFailure(message: ResponseMessage.serverError);
      case Status.unauthorized:
        return const ServerFailure(message: ResponseMessage.unauthorized);
      case Status.connectTimeout:
        return const ServerFailure(message: ResponseMessage.connectTimeout);
      case Status.canceled:
        return const ServerFailure(message: ResponseMessage.canceled);
      case Status.receiveTimeout:
        return const ServerFailure(message: ResponseMessage.receiveTimeout);
      case Status.sendTimeout:
        return const ServerFailure(message: ResponseMessage.sendTimeout);
      case Status.noInternetConnection:
        return const NetworkFailure(message: ResponseMessage.noInternetConnection);
      default:
        return const ServerFailure(message: ResponseMessage.unknown);
    }
  }
}