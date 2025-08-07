import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:techara_merchant/src/api/rest_client.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/core/extenstion/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/core/network/dio_interceptor.dart';
import 'package:techara_merchant/src/core/network/dio_log_interceptor.dart';
import 'package:techara_merchant/src/core/network/error_model.dart';
import 'package:techara_merchant/src/core/network/network_handle_error.dart';

@lazySingleton
class ApiClient {
  RestClient instance(String? url) {
    // final token = LocalDatabase.getToken();
    var dio = Dio();

    // dio.options.headers['Accept'] = 'application/json';
    // dio.options.headers['Content-Type'] = 'application/json';

    // dio.options.headers['app-platform-type'] = Platform.isAndroid
    //     ? "ANDROID"
    //     : Platform.isIOS
    //     ? "IOS"
    //     : "OTHER";

    dio.interceptors.add(DioInterceptor(dio));
    dio.interceptors.add(DioLogger());

    final restClient = RestClient(dio, baseUrl: baseUrl);

    return restClient;
  }
}

extension ApiCallHandler<T> on Future<Response<dynamic>> {
  Future<DataState<T>> result<T>(
    T Function(Map<String, dynamic> json) dataType,
  ) async {
    try {
      final data = await this;
      kdp(name: 'datafadf', msg: jsonEncode(data.data), c: 'gr');
      return DataSuccess(dataType(data.data['data']));
    } on DioException catch (dioError) {
      return NetworkHandler.getDataFailed<T>(dioError);
    } catch (error) {
      kdp(name: 'Exaption', msg: error, c: 'r');

      return DataFailed(InternetConnectionError());
    }
  }

  Future<DataState<T>> resultWithList<T>(
    T Function(List<dynamic> json) dataType,
  ) async {
    try {
      final data = await this;
      //   kdp(name: "datafadf", msg: jsonEncode(data.data), c: "gr");

      return DataSuccess(dataType(data.data['data']));
    } on DioException catch (dioError) {
      return NetworkHandler.getDataFailed<T>(dioError);
    } catch (error) {
      return DataFailed(InternetConnectionError());
    }
  }

  Future<DataState<T>> resultWithoutData<T>(
    T Function(Map<String, dynamic> json) dataType,
  ) async {
    try {
      final data = await this;
      // kdp(name: "resultWithoutData", msg: jsonEncode(data.data), c: "m");

      return DataSuccess(dataType(data.data));
    } on DioException catch (dioError) {
      return NetworkHandler.getDataFailed<T>(dioError);
    } catch (error) {
      return DataFailed(InternetConnectionError());
    }
  }

  Future<DataState<T>> resultWithTypeResponse<T, RT>(
    Function(RT json) dataType,
  ) async {
    try {
      final data = await this;
      // L.success(name: "s", msg: data.data.toString());
      return DataSuccess(dataType(data.data['data'] as RT));
    } on DioException catch (dioError) {
      return NetworkHandler.getDataFailed<T>(dioError);
    } catch (error) {
      kdp(name: 'Exaption: ', msg: error, c: 'r');

      return DataFailed(InternetConnectionError());
    }
  }
}
