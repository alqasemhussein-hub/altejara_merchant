import 'package:dio/dio.dart';
import 'package:techara_merchant/api/export.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/core/network/dio_client.dart';
import 'package:techara_merchant/src/core/network/error_model.dart';
import 'package:techara_merchant/utils/injector.dart';

class ResetPasswordDataSource {
  Future<DataState<void>> chanagePassword(EditPasswordForm e) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .auth
          .postApiAuthEditPassword(body: e);

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
