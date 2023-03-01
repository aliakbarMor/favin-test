import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:favin_test/base/api/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:favin_test/base/app_exception.dart';
import 'package:favin_test/utils/environment.dart';

class HttpApi extends AppApi {
  static const int timeOutException = 20;

  @override
  Future<dynamic> get(String api, {isNeedToken = false}) async {
    var uri = Uri.parse(Environment.baseUrl + api);
    var headers = {
      'Accept': 'application/json',
      'content-type': 'application/json',
    };
    try {
      var response = await http
          .get(
            uri,
            headers: headers,
          )
          .timeout(const Duration(seconds: timeOutException));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  @override
  Future<dynamic> post(
    String api,
    dynamic payload, {
    isNeedToken = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    var uri = Uri.parse(Environment.baseUrl + api);
    var headers = {
      'Accept': 'application/json',
      'content-type': 'application/json',
    };
    if (isNeedToken) {
      headers.addAll({'': ''});
    }
    try {
      var response = await http
          .post(
            uri,
            headers: headers,
            body: jsonEncode(payload),
          )
          .timeout(const Duration(seconds: timeOutException));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 401:
      case 403:
        var error = utf8.decode(response.bodyBytes);
        debugPrint('UnAuthorizedException $error');
        throw UnAuthorizedException(error, response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
