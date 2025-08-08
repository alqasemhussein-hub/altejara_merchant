import 'package:dio/dio.dart';
import 'package:techara_merchant/api/models/certificate/certifecate_list_response.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/core/network/dio_client.dart';
import 'package:techara_merchant/src/core/network/error_model.dart';
import 'package:techara_merchant/utils/injector.dart';

class CertificateDatsource {
  Future<DataState<CertifecateListResponse>> getCertificateDatsourceData({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .certifecate
          .getApiCertifecateGetCertifecateList(
            pageNumber: page,
            pageSize: pageSize,
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
