import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:techara_merchant/api/models/auth/confirm_order_form.dart';
import 'package:techara_merchant/api/models/auth/resend_code.dart';
import 'package:techara_merchant/api/models/auth/verify_forget_password.dart';
import 'package:techara_merchant/api/models/change_password_form.dart';
import 'package:techara_merchant/api/models/forget_password_query.dart';
import 'package:techara_merchant/api/models/login_form.dart';
import 'package:techara_merchant/api/models/login_response.dart';
import 'package:techara_merchant/api/models/tajer_filter.dart';
import 'package:techara_merchant/api/models/user_order_form.dart';
import 'package:techara_merchant/api/models/user_validate_form.dart';
import 'package:techara_merchant/api/models/verify_2fa_response.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/core/network/dio_client.dart';
import 'package:techara_merchant/src/core/network/error_model.dart';
import 'package:techara_merchant/utils/injector.dart';

class AuthRemoteDataSource {
  Future<DataState<bool>> sendOtpForRegisterApi({
    required String classNumber,
  }) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .auth
          .resendCode(body: ResendCode(azberNum: classNumber));
      return DataSuccess(result);
    } on DioException catch (e) {
      return DataFailed(
        ErrorResponseModel(
          statusCode: e.response?.statusCode ?? 500,
          reason: e.response?.data.toString() ?? 'Unknown error',
        ),
      );
    }
  }

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
          reason:
              e.response?.data['error']['message'].toString() ??
              'حدث خطأ اثناء تسجيل الدخول',
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

  Future<DataState<String>> verifyForgetPassword({
    required String classNumber,
    required String code,
  }) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .auth
          .veriftForgetPasswordApi(
            body: VerifyForgetPasswordForm(azberNum: classNumber, code: code),
          );
      return DataSuccess(result);
    } on DioException catch (e) {
      final error = jsonDecode(e.response?.data);
      return DataFailed(
        ErrorResponseModel(
          statusCode: e.response?.statusCode ?? 500,
          reason: error['Message'] ?? 'Unknown error',
        ),
      );
    }
  }

  Future<DataState<void>> resendOtpForLogin({
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

  Future<DataState<bool>> checkClassNumber({
    required String classNumber,
  }) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .auth
          .postApiAuthCheckAzbara(body: TajerFilter(azbararNum: classNumber));
      return DataSuccess(result);
    } on DioException catch (e) {
      return DataFailed(
        ErrorResponseModel(
          statusCode: e.response?.statusCode ?? 500,
          reason: e.response?.data['Message'].toString() ?? 'Unknown error',
        ),
      );
    }
  }

  Future<DataState<bool>> validationPhoneAndEmail({
    required String email,
    required String phone,
  }) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .auth
          .postApiAuthUserValidate(
            body: UserValidateForm(email: email, phoneNumber: phone),
          );
      return DataSuccess(result);
    } on DioException catch (e) {
      return DataFailed(
        ErrorResponseModel(
          statusCode: e.response?.statusCode ?? 500,
          reason: e.response?.data['Message'].toString() ?? 'Unknown error',
        ),
      );
    }
  }

  Future<DataState<String>> submitUserData({
    required UserOrderForm userData,
  }) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .auth
          .postApiAuthSendOrder(body: userData);
      return DataSuccess(result);
    } on DioException catch (e) {
      return DataFailed(
        ErrorResponseModel(
          statusCode: e.response?.statusCode ?? 500,
          reason: e.response?.data.toString() ?? 'Unknown error',
        ),
      );
    }
  }

  Future<DataState<ConfirmOrderResponse>> confirmOtp({
    required ConfirmOrderForm data,
  }) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .auth
          .postApiAuthConfirmOrder(body: data);
      return DataSuccess(result);
    } on DioException catch (e) {
      return DataFailed(
        ErrorResponseModel(
          statusCode: e.response?.statusCode ?? 500,
          reason: e.response?.data.toString() ?? 'Unknown error',
        ),
      );
    }
  }

  Future<DataState<(String, String)>> submitToForgetPassword({
    required ForgetPasswordQuery post,
  }) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .auth
          .postApiAuthForgetPassword(body: post);
      if (result.isEmpty) {
        return DataFailed(
          ErrorResponseModel(statusCode: 400, reason: 'Invalid request'),
        );
      }
      final _value = result as Map<String, dynamic>;
      if (_value.containsKey('email')) {
        return DataSuccess((_value['email'] as String, 'email'));
      }
      if (_value.containsKey('phone')) {
        return DataSuccess((_value['phone'] as String, 'phone'));
      }
      return DataFailed(
        ErrorResponseModel(statusCode: 400, reason: 'Invalid response format'),
      );
    } on DioException catch (e) {
      // final d = e.response?.data['Message'];
      // final errorMessage = e.response?.statusCode ?? 500;
      try {
        return DataFailed(
          ErrorResponseModel(
            statusCode: e.response?.statusCode ?? 500,
            reason: e.response?.data['Message'].toString() ?? 'Unknown error',
          ),
        );
      } catch (e) {
        return DataFailed(
          ErrorResponseModel(statusCode: 500, reason: 'error not clear'),
        );
      }
    }
  }

  Future<DataState<bool>> resetPassword({required String newPassword}) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .auth
          .changePassword(body: ChangePasswordForm(password: newPassword));

      return DataSuccess(true);
    } on DioException catch (e) {
      // final d = e.response?.data['Message'];
      // final errorMessage = e.response?.statusCode ?? 500;
      try {
        return DataFailed(
          ErrorResponseModel(
            statusCode: e.response?.statusCode ?? 500,
            reason: e.response?.data['Message'].toString() ?? 'Unknown error',
          ),
        );
      } catch (e) {
        return DataFailed(
          ErrorResponseModel(statusCode: 500, reason: 'error not clear'),
        );
      }
    }
  }
}
