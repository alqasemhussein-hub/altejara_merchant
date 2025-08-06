import 'dart:io';

import 'package:dio/dio.dart';
import 'package:techara_merchant/src/core/extenstion/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/core/network/error_model.dart';
import 'package:techara_merchant/src/core/usecase/logout_usecase.dart';

class NetworkHandler<T> {
  static DataState<T> getDataFailed<T>(DioException dioError) {
    if (dioError.type == DioExceptionType.unknown &&
        dioError.error is SocketException &&
        (dioError.error as SocketException).osError?.message ==
            "Network is unreachable") {
      return DataFailed<T>(InternetConnectionError());
    }

    if (dioError.type == DioExceptionType.unknown &&
        dioError.error is SocketException &&
        (dioError.error as SocketException).osError?.message ==
            "Connection refused") {
      return DataFailed<T>(ServerError());
    }
    if (dioError.type == DioExceptionType.unknown ||
        dioError.type == DioExceptionType.connectionTimeout ||
        dioError.type == DioExceptionType.receiveTimeout ||
        dioError.type == DioExceptionType.sendTimeout) {
      return DataFailed<T>(InternetConnectionError());
    }

    if (dioError.response?.statusCode == 418) {
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   goAndRemoveUntil(const MaintenancePage());
      // });
    }
    if (dioError.response?.statusCode == 444) {
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   goAndRemoveUntil(const UpdateAppPage());
      // });
    }

    ErrorResponseModel? error;
    errorLog(dioError);
    if (dioError.response == null ||
        dioError.response!.data == null ||
        dioError.response!.statusCode! > 499) {
      error = ErrorResponseModel(
        reason: "server_error",
        statusCode: dioError.response?.statusCode ?? 500,
      );
    } else {
      error = ErrorResponseModel.fromJson(dioError.response?.data);
    }

    switch (error.reason) {
      case "JWT_VALIDATE_TOKEN_INVALID":
        logoutUseCase();
        return DataFailed<T>(InvalidToken(reason: error.reason));
      case "JWT_VALIDATE_TOKEN_EXPIRE":
        logoutUseCase();
        return DataFailed<T>(InvalidToken(reason: error.reason));
      case "*_*_*_TOO_MANY_REQUESTS":
        return DataFailed<T>(TooManyRequests(reason: error.reason));

      case "*_*_*_PAYLOAD_TOO_LARGE":
        return DataFailed<T>(RequestBodyTooLargError(reason: error.reason));

      case "AUTH_OTP_TOO_MANY_REQUESTS":
        return DataFailed<T>(OtpAleradySent(reason: error.reason));

      case "CREDENTIALS_*_*_INVALID":
        return DataFailed<T>(CredentialsInvalidError(reason: error.reason));

      case "PHONE_*_*_EXISTS":
        return DataFailed<T>(PhoneExistError(reason: error.reason));

      case "USER_*_*_INACTIVE":
        return DataFailed<T>(UserInactiveError(reason: error.reason));

      default:
        return DataFailed<T>(NotFoundResponse(reason: error.reason));
    }
  }

  static handdleRequestExceptionMessages(
    DataFailed result, {
    String? cridentialError,
  }) {
    if (result.error is CredentialsInvalidError && cridentialError != null) {
      //   showTMDialog(
      //     title: "fail".tr(),
      //     msg: cridentialError.tr(),
      //     icon: const Icon(FeatherIcons.alertTriangle, color: Colors.red),
      //   );
      //   return;
      // }
      // showTMDialog(
      //   title: "fail".tr(),
      //   msg: result.error?.reason.tr() ?? "unknown_error".tr(),
      //   icon: const Icon(FeatherIcons.alertTriangle, color: Colors.red),
      // );
    }
  }
}

void errorLog(DioException dioError, {String? T}) {
  Map<String, dynamic> req = {};

  try {
    req = (dioError.requestOptions.data as Map<String, dynamic>);
  } catch (_) {}
  try {
    req["frontSide"] = (req["frontSide"] as String).length.toString();
    req["backSide"] = req["backSide"].length.toString();
    req["embeddedFace"] = req["embeddedFace"].length.toString();
  } catch (_) {}

  Map<String, dynamic> response = {};
  try {
    response = (dioError.response?.data as Map<String, dynamic>);
  } catch (_) {}
  try {
    response["frontSide"] = (response["frontSide"] as String).length;
    response["backSide"] = response["backSide"].length;
    response["embeddedFace"] = response["embeddedFace"].length;
  } catch (_) {}

  kdp(name: "error ", msg: '$response', c: 'r');
  // kdp(name: "datatype", msg: '$T bodyrequest: $req', c: 'r');
}
