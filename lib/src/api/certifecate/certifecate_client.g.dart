// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certifecate_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _CertifecateClient implements CertifecateClient {
  _CertifecateClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<void> postApiCertifecateAddCertifecate({CertifecateForm? body}) async {
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
            '/api/Certifecate/add-Certifecate',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> getApiCertifecateGetRegTotalWight({String? regNo}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'RegNo': regNo};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/Certifecate/get-Reg-Total-Wight',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> getApiCertifecateGetCertifecateList({
    int? id,
    String? productDscrp,
    String? targetName,
    String? sourceCountry,
    String? generationDscrp,
    String? notes,
    String? detailsDscrp,
    String? detailsTypeDscrp,
    String? wigth,
    String? certificateNo,
    DateTime? certificateDate,
    String? targetAddress,
    String? lang,
    String? regNo,
    DateTime? regDate,
    int? targetCountry,
    int? tranzetCountry,
    int? goverId,
    double? wigthNum,
    String? wigthDetails,
    bool? isOrder,
    String? serialCertefecate,
    int? pageNumber,
    int? pageSize,
    bool? deleted,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Id': id,
      r'ProductDscrp': productDscrp,
      r'TargetName': targetName,
      r'SourceCountry': sourceCountry,
      r'GenerationDscrp': generationDscrp,
      r'Notes': notes,
      r'DetailsDscrp': detailsDscrp,
      r'DetailsTypeDscrp': detailsTypeDscrp,
      r'Wigth': wigth,
      r'CertificateNo': certificateNo,
      r'CertificateDate': certificateDate?.toIso8601String(),
      r'TargetAddress': targetAddress,
      r'Lang': lang,
      r'RegNo': regNo,
      r'RegDate': regDate?.toIso8601String(),
      r'TargetCountry': targetCountry,
      r'TranzetCountry': tranzetCountry,
      r'GoverId': goverId,
      r'WigthNum': wigthNum,
      r'WigthDetails': wigthDetails,
      r'IsOrder': isOrder,
      r'serialCertefecate': serialCertefecate,
      r'PageNumber': pageNumber,
      r'PageSize': pageSize,
      r'Deleted': deleted,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/Certifecate/get-Certifecate-List',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> getApiCertifecateGetTajerData() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/Certifecate/get-Tajer-Data',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> getApiCertifecateGetCertifecateParams() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/Certifecate/get-Certifecate-Params',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> getApiCertifecateGetCertifecatePrices() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/Certifecate/get-Certifecate-prices',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> getApiCertifecateGetCertifecateDetails({
    String? orderNumber,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'orderNumber': orderNumber};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/Certifecate/get-Certifecate-Details',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> getApiCertifecateGetGenerationData() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/Certifecate/get-Generation-Data',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> getApiCertifecateGetCertificateId({String? orderNumber}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'orderNumber': orderNumber};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/Certifecate/get-certificate-id',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> getApiCertifecateGetRegExpireDate({
    String? regNo,
    String? date,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'regNo': regNo, r'date': date};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/Certifecate/get-reg-expire-date',
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
