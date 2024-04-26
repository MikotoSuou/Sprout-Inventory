// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DioErrorResponse _$DioErrorResponseFromJson(Map<String, dynamic> json) =>
    DioErrorResponse(
      json['error'] as String?,
      json['detail'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$DioErrorResponseToJson(DioErrorResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'detail': instance.detail,
      'message': instance.message,
    };
