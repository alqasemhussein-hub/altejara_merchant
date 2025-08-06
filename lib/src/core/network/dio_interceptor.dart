import 'package:dio/dio.dart';

class DioInterceptor extends InterceptorsWrapper {
  final Dio dio;
  DioInterceptor(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }
}
