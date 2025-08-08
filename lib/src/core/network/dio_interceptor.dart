import 'package:dio/dio.dart';
import 'package:techara_merchant/src/core/service/local_storage.dart';

class DioInterceptor extends InterceptorsWrapper {
  final Dio dio;
  DioInterceptor(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = LocalDatabase.getUserEntity()?.token;

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }
}
