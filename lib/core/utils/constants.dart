
class Constants {

  // common
  static const String emptyString = '';

  // api
  static const String baseUrl = "https://dummyjson.com/";
  static const String authorization = "Authorization";
  static const String cookie = "Cookie";
  static const String applicationJson = "application/json; charset=utf-8";
  static const String contentType = "content-type";
  static const String accept = "accept";
  static const Map<String, String> headers = {
    contentType: applicationJson,
    accept: applicationJson,
  };
  static const Duration apiTimeout = Duration(seconds: 30);

}