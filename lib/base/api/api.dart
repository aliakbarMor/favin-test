abstract class AppApi {
  get(String api, {isNeedToken = false});

  post(
    String api,
    dynamic payload, {
    isNeedToken = false,
    Map<String, dynamic>? queryParameters,
  });
}
