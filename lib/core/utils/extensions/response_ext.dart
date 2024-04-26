
import 'package:dio/dio.dart';
import 'package:sprout_inventory/core/error/error_handler.dart';
import 'package:sprout_inventory/core/utils/constants.dart';

extension ResponseExt on Response? {

  String get optString => (this == null) ? Constants.emptyString : this!.toString();

  bool get isSuccessful => (this == null) ? false : (this!.statusCode != null && this!.statusCode! == 200);

  String get errorMessage => (this == null && this!.statusMessage == null) ? ResponseMessage.unknown : this!.statusMessage!;

}