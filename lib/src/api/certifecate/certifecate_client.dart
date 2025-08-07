// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/certifecate_form.dart';

part 'certifecate_client.g.dart';

@RestApi()
abstract class CertifecateClient {
  factory CertifecateClient(Dio dio, {String? baseUrl}) = _CertifecateClient;

  @POST('/api/Certifecate/add-Certifecate')
  Future<void> postApiCertifecateAddCertifecate({
    @Body() CertifecateForm? body,
  });

  @GET('/api/Certifecate/get-Reg-Total-Wight')
  Future<void> getApiCertifecateGetRegTotalWight({
    @Query('RegNo') String? regNo,
  });

  @GET('/api/Certifecate/get-Certifecate-List')
  Future<void> getApiCertifecateGetCertifecateList({
    @Query('Id') int? id,
    @Query('ProductDscrp') String? productDscrp,
    @Query('TargetName') String? targetName,
    @Query('SourceCountry') String? sourceCountry,
    @Query('GenerationDscrp') String? generationDscrp,
    @Query('Notes') String? notes,
    @Query('DetailsDscrp') String? detailsDscrp,
    @Query('DetailsTypeDscrp') String? detailsTypeDscrp,
    @Query('Wigth') String? wigth,
    @Query('CertificateNo') String? certificateNo,
    @Query('CertificateDate') DateTime? certificateDate,
    @Query('TargetAddress') String? targetAddress,
    @Query('Lang') String? lang,
    @Query('RegNo') String? regNo,
    @Query('RegDate') DateTime? regDate,
    @Query('TargetCountry') int? targetCountry,
    @Query('TranzetCountry') int? tranzetCountry,
    @Query('GoverId') int? goverId,
    @Query('WigthNum') double? wigthNum,
    @Query('WigthDetails') String? wigthDetails,
    @Query('IsOrder') bool? isOrder,
    @Query('serialCertefecate') String? serialCertefecate,
    @Query('PageNumber') int? pageNumber,
    @Query('PageSize') int? pageSize,
    @Query('Deleted') bool? deleted,
  });

  @GET('/api/Certifecate/get-Tajer-Data')
  Future<void> getApiCertifecateGetTajerData();

  @GET('/api/Certifecate/get-Certifecate-Params')
  Future<void> getApiCertifecateGetCertifecateParams();

  @GET('/api/Certifecate/get-Certifecate-prices')
  Future<void> getApiCertifecateGetCertifecatePrices();

  @GET('/api/Certifecate/get-Certifecate-Details')
  Future<void> getApiCertifecateGetCertifecateDetails({
    @Query('orderNumber') String? orderNumber,
  });

  @GET('/api/Certifecate/get-Generation-Data')
  Future<void> getApiCertifecateGetGenerationData();

  @GET('/api/Certifecate/get-certificate-id')
  Future<void> getApiCertifecateGetCertificateId({
    @Query('orderNumber') String? orderNumber,
  });

  @GET('/api/Certifecate/get-reg-expire-date')
  Future<void> getApiCertifecateGetRegExpireDate({
    @Query('regNo') String? regNo,
    @Query('date') String? date,
  });
}
