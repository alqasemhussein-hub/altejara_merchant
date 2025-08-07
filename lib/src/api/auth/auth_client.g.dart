// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _AuthClient implements AuthClient {
  _AuthClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<void> postApiAuthLogin({bool? whatsapp, LoginForm? body}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'whatsapp': whatsapp};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/login',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthVerify2fa({String? azberNum, String? code}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'azberNum': azberNum,
      r'code': code,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/Auth/verify-2fa',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthResend2faCode({
    bool? whatsapp = false,
    String? azbaraNum,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'whatsapp': whatsapp,
      r'azbaraNum': azbaraNum,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/Auth/resend-2fa-code',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthEditPassword({EditPasswordForm? body}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/edit-password',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthRegister({RegisterForm? body}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/register',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthCheckAzbara({TajerFilter? body}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/check-azbara',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthForgetPassword({ForgetPasswordQuery? body}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/forget-password',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthOtpVerify({ConfirmEmailForm? body}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/otp-verify',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthChangePassword({ChangePasswordForm? body}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/change-password',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthConfirmEmail({ConfirmEmailForm? body}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/confirm-email',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthActivateUser({UserActivateForm? body}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/activate-user',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthRegisterGove({
    String? azbaraNum,
    String? merchentID,
    String? nameE,
    String? nameA,
    String? email,
    String? phoneNumber,
    String? arTitle,
    String? title,
    String? address,
    String? addressE,
    String? jobAddress,
    String? jobAddressE,
    String? fullNameA,
    String? fullNameE,
    String? activityA,
    String? activityE,
    String? categoryidA,
    String? categoryidE,
    String? classTypeNo,
    String? tradeNo,
    DateTime? regstrationdate,
    int? goverID,
    File? image,
    DateTime? creationDate,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (azbaraNum != null) {
      _data.fields.add(MapEntry('AzbaraNum', azbaraNum));
    }
    if (merchentID != null) {
      _data.fields.add(MapEntry('MerchentID', merchentID));
    }
    if (nameE != null) {
      _data.fields.add(MapEntry('NameE', nameE));
    }
    if (nameA != null) {
      _data.fields.add(MapEntry('NameA', nameA));
    }
    if (email != null) {
      _data.fields.add(MapEntry('Email', email));
    }
    if (phoneNumber != null) {
      _data.fields.add(MapEntry('PhoneNumber', phoneNumber));
    }
    if (arTitle != null) {
      _data.fields.add(MapEntry('ArTitle', arTitle));
    }
    if (title != null) {
      _data.fields.add(MapEntry('Title', title));
    }
    if (address != null) {
      _data.fields.add(MapEntry('Address', address));
    }
    if (addressE != null) {
      _data.fields.add(MapEntry('AddressE', addressE));
    }
    if (jobAddress != null) {
      _data.fields.add(MapEntry('JobAddress', jobAddress));
    }
    if (jobAddressE != null) {
      _data.fields.add(MapEntry('JobAddressE', jobAddressE));
    }
    if (fullNameA != null) {
      _data.fields.add(MapEntry('FullNameA', fullNameA));
    }
    if (fullNameE != null) {
      _data.fields.add(MapEntry('FullNameE', fullNameE));
    }
    if (activityA != null) {
      _data.fields.add(MapEntry('ActivityA', activityA));
    }
    if (activityE != null) {
      _data.fields.add(MapEntry('ActivityE', activityE));
    }
    if (categoryidA != null) {
      _data.fields.add(MapEntry('CategoryidA', categoryidA));
    }
    if (categoryidE != null) {
      _data.fields.add(MapEntry('CategoryidE', categoryidE));
    }
    if (classTypeNo != null) {
      _data.fields.add(MapEntry('ClassTypeNo', classTypeNo));
    }
    if (tradeNo != null) {
      _data.fields.add(MapEntry('TradeNo', tradeNo));
    }
    if (goverID != null) {
      _data.fields.add(MapEntry('GoverID', goverID.toString()));
    }
    if (image != null) {
      if (image != null) {
        _data.files.add(
          MapEntry(
            'Image',
            MultipartFile.fromFileSync(
              image.path,
              filename: image.path.split(Platform.pathSeparator).last,
            ),
          ),
        );
      }
    }
    final _options = _setStreamType<void>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            '/api/auth/Register-Gove',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthResendCode({String? azbaraNumber}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (azbaraNumber != null) {
      _data.fields.add(MapEntry('azbaraNumber', azbaraNumber));
    }
    final _options = _setStreamType<void>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            '/api/auth/resend-code',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthTestTajer({
    String? azbaraNum,
    String? merchentID,
    String? nameE,
    String? nameA,
    String? email,
    String? phoneNumber,
    String? arTitle,
    String? title,
    String? address,
    String? addressE,
    String? jobAddress,
    String? jobAddressE,
    String? fullNameA,
    String? fullNameE,
    String? activityA,
    String? activityE,
    String? categoryidA,
    String? categoryidE,
    String? classTypeNo,
    String? tradeNo,
    DateTime? regstrationdate,
    int? goverID,
    String? tradeNumber,
    String? registrationDate,
    File? imageFile,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (azbaraNum != null) {
      _data.fields.add(MapEntry('AzbaraNum', azbaraNum));
    }
    if (merchentID != null) {
      _data.fields.add(MapEntry('MerchentID', merchentID));
    }
    if (nameE != null) {
      _data.fields.add(MapEntry('NameE', nameE));
    }
    if (nameA != null) {
      _data.fields.add(MapEntry('NameA', nameA));
    }
    if (email != null) {
      _data.fields.add(MapEntry('Email', email));
    }
    if (phoneNumber != null) {
      _data.fields.add(MapEntry('PhoneNumber', phoneNumber));
    }
    if (arTitle != null) {
      _data.fields.add(MapEntry('ArTitle', arTitle));
    }
    if (title != null) {
      _data.fields.add(MapEntry('Title', title));
    }
    if (address != null) {
      _data.fields.add(MapEntry('Address', address));
    }
    if (addressE != null) {
      _data.fields.add(MapEntry('AddressE', addressE));
    }
    if (jobAddress != null) {
      _data.fields.add(MapEntry('JobAddress', jobAddress));
    }
    if (jobAddressE != null) {
      _data.fields.add(MapEntry('JobAddressE', jobAddressE));
    }
    if (fullNameA != null) {
      _data.fields.add(MapEntry('FullNameA', fullNameA));
    }
    if (fullNameE != null) {
      _data.fields.add(MapEntry('FullNameE', fullNameE));
    }
    if (activityA != null) {
      _data.fields.add(MapEntry('ActivityA', activityA));
    }
    if (activityE != null) {
      _data.fields.add(MapEntry('ActivityE', activityE));
    }
    if (categoryidA != null) {
      _data.fields.add(MapEntry('CategoryidA', categoryidA));
    }
    if (categoryidE != null) {
      _data.fields.add(MapEntry('CategoryidE', categoryidE));
    }
    if (classTypeNo != null) {
      _data.fields.add(MapEntry('ClassTypeNo', classTypeNo));
    }
    if (tradeNo != null) {
      _data.fields.add(MapEntry('TradeNo', tradeNo));
    }
    if (goverID != null) {
      _data.fields.add(MapEntry('GoverID', goverID.toString()));
    }
    if (tradeNumber != null) {
      _data.fields.add(MapEntry('TradeNumber', tradeNumber));
    }
    if (registrationDate != null) {
      _data.fields.add(MapEntry('RegistrationDate', registrationDate));
    }
    if (imageFile != null) {
      if (imageFile != null) {
        _data.files.add(
          MapEntry(
            'Image.File',
            MultipartFile.fromFileSync(
              imageFile.path,
              filename: imageFile.path.split(Platform.pathSeparator).last,
            ),
          ),
        );
      }
    }
    final _options = _setStreamType<void>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            '/api/auth/test-tajer',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthCreateUserByTajer({int? id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (id != null) {
      _data.fields.add(MapEntry('id', id.toString()));
    }
    final _options = _setStreamType<void>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            '/api/auth/create-user-by-tajer',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthUpdateTajer({
    String? nameE,
    String? nameA,
    String? title,
    String? arTitle,
    String? activityA,
    String? activityE,
    String? categoryidA,
    String? classTypeNo,
    String? tradeNo,
    String? email,
    int? goverID,
    String? phoneNumber,
    DateTime? registerationdate,
    String? address,
    String? jobAddressA,
    String? jobAddressE,
    File? image,
    DateTime? creationDate,
    int? id,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (nameE != null) {
      _data.fields.add(MapEntry('NameE', nameE));
    }
    if (nameA != null) {
      _data.fields.add(MapEntry('NameA', nameA));
    }
    if (title != null) {
      _data.fields.add(MapEntry('Title', title));
    }
    if (arTitle != null) {
      _data.fields.add(MapEntry('ArTitle', arTitle));
    }
    if (activityA != null) {
      _data.fields.add(MapEntry('ActivityA', activityA));
    }
    if (activityE != null) {
      _data.fields.add(MapEntry('ActivityE', activityE));
    }
    if (categoryidA != null) {
      _data.fields.add(MapEntry('CategoryidA', categoryidA));
    }
    if (classTypeNo != null) {
      _data.fields.add(MapEntry('ClassTypeNo', classTypeNo));
    }
    if (tradeNo != null) {
      _data.fields.add(MapEntry('TradeNo', tradeNo));
    }
    if (email != null) {
      _data.fields.add(MapEntry('Email', email));
    }
    if (goverID != null) {
      _data.fields.add(MapEntry('GoverID', goverID.toString()));
    }
    if (phoneNumber != null) {
      _data.fields.add(MapEntry('PhoneNumber', phoneNumber));
    }
    if (address != null) {
      _data.fields.add(MapEntry('Address', address));
    }
    if (jobAddressA != null) {
      _data.fields.add(MapEntry('JobAddressA', jobAddressA));
    }
    if (jobAddressE != null) {
      _data.fields.add(MapEntry('JobAddressE', jobAddressE));
    }
    if (image != null) {
      if (image != null) {
        _data.files.add(
          MapEntry(
            'Image',
            MultipartFile.fromFileSync(
              image.path,
              filename: image.path.split(Platform.pathSeparator).last,
            ),
          ),
        );
      }
    }
    if (id != null) {
      _data.fields.add(MapEntry('id', id.toString()));
    }
    final _options = _setStreamType<void>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            '/api/auth/update-tajer',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> getApiAuthResendPassword({int? id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/resend_password',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> deleteApiAuthDeleteTajerF({int? id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/delete-tajer-f',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> getApiAuthGetClasses({int? id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/get-classes',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthUserValidate({UserValidateForm? body}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/Auth/user-validate',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> deleteApiAuthDeleteUser({String? id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/delete-user',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthSendOrder({UserOrderForm? body}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/sendOrder',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthConfirmOrder({ConfirmOrderForm? body}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/confirm_order',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> getApiAuthGetOrders({int? page}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/get-orders',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> getApiAuthGetOrder({int? id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/get-order',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthAcceptOrder({int? id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (id != null) {
      _data.fields.add(MapEntry('id', id.toString()));
    }
    final _options = _setStreamType<void>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            '/api/auth/accept-order',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthRejectOrder({int? id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (id != null) {
      _data.fields.add(MapEntry('id', id.toString()));
    }
    final _options = _setStreamType<void>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            '/api/auth/reject-order',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> postApiAuthResendConfirmationCode({String? email}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (email != null) {
      _data.fields.add(MapEntry('email', email));
    }
    final _options = _setStreamType<void>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            '/api/auth/resend-confirmation-code',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> getApiAuthGetUsers({int? page}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'Page': page};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/get-users',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> getApiAuthGetUser({int? id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/auth/get-user',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
