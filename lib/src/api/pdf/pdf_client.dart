// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'pdf_client.g.dart';

@RestApi()
abstract class PdfClient {
  factory PdfClient(Dio dio, {String? baseUrl}) = _PdfClient;

  @GET('/api/pdf/get-path')
  Future<void> getApiPdfGetPath();
}
