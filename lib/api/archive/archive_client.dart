// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'archive_client.g.dart';

@RestApi()
abstract class ArchiveClient {
  factory ArchiveClient(Dio dio, {String? baseUrl}) = _ArchiveClient;

  @GET('/api/Archive/archiving-docs-qr')
  Future<void> getApiArchiveArchivingDocsQr({
    @Query('qrCode') String? qrCode,
    @Query('userName') String? userName,
    @Query('passwrod') String? passwrod,
  });

  @GET('/api/Archive/getData')
  Future<void> getApiArchiveGetData({
    @Query('qr') String? qr,
  });

  @GET('/api/Archive/get-books-data')
  Future<void> getApiArchiveGetBooksData({
    @Query('qr') String? qr,
    @Header('AccessKey') String? accessKey,
  });

  @GET('/api/Archive/get-certificate')
  Future<void> getApiArchiveGetCertificate({
    @Query('id') int? id,
  });

  @GET('/api/Archive/get-formal-book')
  Future<void> getApiArchiveGetFormalBook({
    @Query('id') String? id,
  });

  @GET('/api/Archive/get-certificate-data')
  Future<void> getApiArchiveGetCertificateData({
    @Query('id') int? id,
  });
}
