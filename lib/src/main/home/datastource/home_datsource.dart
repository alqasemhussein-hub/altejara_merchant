import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:techara_merchant/api/models/home/home_data_response.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/core/network/dio_client.dart';
import 'package:techara_merchant/src/core/network/error_model.dart';
import 'package:techara_merchant/utils/injector.dart';

class HomeDataSource {
  Future<DataState<HomeDataResponse>> getHomeData() async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .home
          .getApiHomeHomeData();
      log(
        result.certificateData?.certificates
                .map((e) => JsonEncoder().convert(e.toJson()))
                .toList()
                .toString() ??
            '',
      );
      return DataSuccess(result);
    } on DioException catch (e) {
      return DataFailed(
        ErrorResponseModel(
          statusCode: e.response?.statusCode ?? 500,
          reason: e.message ?? 'Unknown error',
        ),
      );
    }
  }
}
