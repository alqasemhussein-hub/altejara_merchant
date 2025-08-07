// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'governurates_client.g.dart';

@RestApi()
abstract class GovernuratesClient {
  factory GovernuratesClient(Dio dio, {String? baseUrl}) = _GovernuratesClient;

  @GET('/api/Governurates')
  Future<void> getApiGovernurates();
}
