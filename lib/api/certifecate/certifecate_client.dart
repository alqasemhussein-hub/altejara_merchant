// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:techara_merchant/api/models/certificate/add_certifecate_request.dart';
import 'package:techara_merchant/api/models/certificate/add_certifecate_response.dart';
import 'package:techara_merchant/api/models/certificate/certifecate_list_response.dart';
import 'package:techara_merchant/api/models/certificate/tajer_data_response.dart';

import '../models/certifecate_form.dart';

part 'certifecate_client.g.dart';

@RestApi()
abstract class CertifecateClient {
  factory CertifecateClient(Dio dio, {String? baseUrl}) = _CertifecateClient;
  @GET('/api/Certifecate/get-Certifecate-List')
  Future<CertifecateListResponse> getApiCertifecateGetCertifecateList({
    @Query('PageNumber') required int pageNumber,
    @Query('PageSize') required int pageSize,
  });
  @POST('/api/Certifecate/add-Certifecate')
  Future<AddCertifecateResponse> postApiCertifecateAddCertifecate({
    @Body() required AddCertifecateRequest body,
  });

  /// Get Tajer Data
  @GET('/api/Certifecate/get-Tajer-Data')
  Future<TajerDataResponse> getApiCertifecateGetTajerData();
}
