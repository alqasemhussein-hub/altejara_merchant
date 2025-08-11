import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:techara_merchant/src/core/extenstion/general.dart';

class DioLogger extends InterceptorsWrapper {
  DioLogger();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    L.warning(name: 'EndPoint', msg: options.uri);
    L.warning(name: 'method', msg: options.method);
    L.warning(name: 'header', msg: options.headers.toString());

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    L.success(name: 'Endpoint', msg: response.requestOptions.path);
    L.success(name: 'statusCode', msg: response.statusCode.toString());

    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Check if the user is unauthorized.

    L.error(name: 'Endpoint', msg: '${err.requestOptions.uri}');
    L.error(name: 'method', msg: err.requestOptions.method);
    L.error(name: 'Error Message', msg: jsonEncode(err.response?.data));

    handler.next(err);
  }
}
