// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';

import 'archive/archive_client.dart';
import 'auth/auth_client.dart';
import 'certifecate/certifecate_client.dart';
import 'file/file_client.dart';
import 'governurates/governurates_client.dart';
import 'home/home_client.dart';
import 'payment/payment_client.dart';
import 'pdf/pdf_client.dart';

/// BaghdadChamberAPI Golden Castle `vv1`
class RestClient {
  RestClient(
    Dio dio, {
    String? baseUrl,
  })  : _dio = dio,
        _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  static String get version => 'v1';

  ArchiveClient? _archive;
  AuthClient? _auth;
  CertifecateClient? _certifecate;
  FileClient? _file;
  GovernuratesClient? _governurates;
  HomeClient? _home;
  PaymentClient? _payment;
  PdfClient? _pdf;

  ArchiveClient get archive => _archive ??= ArchiveClient(_dio, baseUrl: _baseUrl);

  AuthClient get auth => _auth ??= AuthClient(_dio, baseUrl: _baseUrl);

  CertifecateClient get certifecate => _certifecate ??= CertifecateClient(_dio, baseUrl: _baseUrl);

  FileClient get file => _file ??= FileClient(_dio, baseUrl: _baseUrl);

  GovernuratesClient get governurates => _governurates ??= GovernuratesClient(_dio, baseUrl: _baseUrl);

  HomeClient get home => _home ??= HomeClient(_dio, baseUrl: _baseUrl);

  PaymentClient get payment => _payment ??= PaymentClient(_dio, baseUrl: _baseUrl);

  PdfClient get pdf => _pdf ??= PdfClient(_dio, baseUrl: _baseUrl);
}
