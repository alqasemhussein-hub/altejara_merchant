class ErrorResponseModel {
  final int statusCode;
  final String reason;

  final String? fullErrorText;

  ErrorResponseModel({
    required this.statusCode,
    required this.reason,
    this.fullErrorText,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    try {
      return ErrorResponseModel(
        statusCode: json['statusCode'],
        reason: json['key'],
      );
    } catch (e) {
      return ErrorResponseModel(
        statusCode: 500,
        reason: 'server_error',
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['statusCode'] = statusCode;
    data['key'] = reason;

    return data;
  }
}

class InvalidToken extends ErrorResponseModel {
  InvalidToken({required super.reason})
      : super(statusCode: 401, fullErrorText: "JWT_VALIDATE_TOKEN_INVALID");
}

class ExpireToken extends ErrorResponseModel {
  ExpireToken({required super.reason})
      : super(statusCode: 401, fullErrorText: "JWT_VALIDATE_TOKEN_EXPIRE");
}

class InternetConnectionError extends ErrorResponseModel {
  InternetConnectionError()
      : super(
            statusCode: 404,
            reason: "internet_error_msg",
            fullErrorText: "internet_error_msg");
}

class TooManyRequests extends ErrorResponseModel {
  TooManyRequests({required super.reason})
      : super(statusCode: 429, fullErrorText: "*_*_*_TOO_MANY_REQUESTS");
}

class AppMustUpdateError extends ErrorResponseModel {
  AppMustUpdateError({required super.reason})
      : super(
            statusCode: 429, fullErrorText: "APP_UPDATER_UPDATE_APP_REQUIRED");
}

class RequestBodyTooLargError extends ErrorResponseModel {
  RequestBodyTooLargError({required super.reason})
      : super(statusCode: 429, fullErrorText: "*_*_*_PAYLOAD_TOO_LARGE");
}

class OtpInvalidError extends ErrorResponseModel {
  OtpInvalidError({required super.reason})
      : super(statusCode: 429, fullErrorText: "OTP_*_*_INVALID");
}

class OtpAleradySent extends ErrorResponseModel {
  OtpAleradySent({required super.reason})
      : super(statusCode: 429, fullErrorText: "OTP_*_*_CONFLICT");
}

class CredentialsInvalidError extends ErrorResponseModel {
  CredentialsInvalidError({required super.reason})
      : super(statusCode: 429, fullErrorText: "CREDENTIALS_*_*_INVALID");
}

class PhoneExistError extends ErrorResponseModel {
  PhoneExistError({required super.reason})
      : super(statusCode: 429, fullErrorText: "PHONE_*_*_EXISTS");
}

class UserInactiveError extends ErrorResponseModel {
  UserInactiveError({required super.reason})
      : super(statusCode: 429, fullErrorText: "USER_*_*_INACTIVE ");
}

class ServerError extends ErrorResponseModel {
  ServerError() : super(statusCode: 500, reason: "server_error");
}

class InvalidInput extends ErrorResponseModel {
  InvalidInput({required super.reason})
      : super(
          statusCode: 400,
        );
}

class UnAuthorizeError extends ErrorResponseModel {
  UnAuthorizeError({required super.reason})
      : super(
          statusCode: 401,
        );
}

class NotFoundResponse extends ErrorResponseModel {
  NotFoundResponse({required super.reason})
      : super(
          statusCode: 404,
        );
}

class NationalBackSideNotAssociatedToFroint extends ErrorResponseModel {
  NationalBackSideNotAssociatedToFroint()
      : super(
          statusCode: 404,
          reason: "NATIONAL_BACK_SIDE_NOT_ASSOCIATED_TO_FROINT",
        );
}








// USER_*_*_INACTIVE                   // user is inactive
// FORENSICS_FACE_DETECTION_*_FAILED   // face detection failed
// FORENSICS_FACE_MATCHING_*_FAILED    // face matching failed
// FORENSICS_LIVENESS_CHECK_*_FAILED   // liveness check failed
// CARD_*_*_CONFLICT                   // card already claimed


