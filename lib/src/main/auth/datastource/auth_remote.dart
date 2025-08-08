import 'package:dio/dio.dart';
import 'package:techara_merchant/api/models/login_form.dart';
import 'package:techara_merchant/api/models/login_response.dart';
import 'package:techara_merchant/api/models/verify_2fa_response.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/core/network/dio_client.dart';
import 'package:techara_merchant/src/core/network/error_model.dart';
import 'package:techara_merchant/utils/injector.dart';

class AuthRemoteDataSource {
  Future<DataState<LoginResponse>> login({
    required String classNumber,
    required String password,
    bool isWhatsApp = false,
  }) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .auth
          .postApiAuthLogin(
            whatsapp: isWhatsApp,
            body: LoginForm(azbaraNum: classNumber, password: password),
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

  Future<DataState<Verify2FaResponse>> verifyLogin({
    required String classNumber,
    required String code,
  }) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .auth
          .postApiAuthVerify2fa(azberNum: classNumber, code: code);
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

  Future<DataState<void>> postApiAuthResend2faCode({
    required String classNumber,
    required bool whatsapp,
  }) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .auth
          .postApiAuthResend2faCode(azbaraNum: classNumber, whatsapp: whatsapp);
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
