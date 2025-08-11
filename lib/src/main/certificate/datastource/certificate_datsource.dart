import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:techara_merchant/api/models/certificate/add_certifecate_request.dart';
import 'package:techara_merchant/api/models/certificate/add_certifecate_response.dart';
import 'package:techara_merchant/api/models/certificate/certifecate_list_response.dart';
import 'package:techara_merchant/api/models/certificate/params/certifecate_params_response.dart';
import 'package:techara_merchant/api/models/certificate/price/certifecate_prices_response.dart';
import 'package:techara_merchant/api/models/certificate/tajer_data_response.dart';
import 'package:techara_merchant/api/models/certificate/upload_file_response.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
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

  Future<DataState<TajerDataResponse>> getTajerData() async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .certifecate
          .getApiCertifecateGetTajerData();
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

  Future<DataState<CertifecateParamsResponse>> getCertificateParameter(
    String lanag,
  ) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null, lanag)
          .certifecate
          .getApiCertifecateGetCertifecateParams();
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

  Future<DataState<CertifecatePricesResponse>>
  getCertificatePricesDaraSource() async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .certifecate
          .getApiCertifecateGetCertifecatePrices();
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

  Future<DataState<AddCertifecateResponse>> submitCertificate(
    AddCertifecateRequest data,
  ) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .certifecate
          .postApiCertifecateAddCertifecate(body: data);
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

  Future<DataState<UploadFileResponse>> uploadFile(File data) async {
    if (!(await data.exists())) {
      return DataFailed(
        ErrorResponseModel(statusCode: 404, reason: 'File not found'),
      );
    }
    try {
      final resultPath = await getIt<ApiClient>()
          .instance(documentUrl)
          .file
          .postApiFileUpload(file: data);
      final d = jsonDecode(resultPath);
      final UploadFileResponse result = UploadFileResponse(
        path: d['path'] as String,
      ); // <-- Manually create the object
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

  Future<DataState<String>> uploadRegistrationFiles(
    List<File> uploadedFiles,
  ) async {
    try {
      final resultPath = await getIt<ApiClient>()
          .instance(documentUrl)
          .file
          .postApiFilePdf(files: uploadedFiles);

      return DataSuccess(resultPath);
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
