import 'package:json_annotation/json_annotation.dart';
part 'dio_error_response.g.dart';

@JsonSerializable()
class DioErrorResponse {
  @JsonKey(name: "error")
  String? error;
  @JsonKey(name: "detail")
  String? detail;
  @JsonKey(name: "message")
  String? message;

  DioErrorResponse(
    this.error,
    this.detail,
    this.message,
  );

  factory DioErrorResponse.fromJson(Map<String, dynamic> json) => _$DioErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DioErrorResponseToJson(this);
}