// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_client.g.dart';

@RestApi()
abstract class HomeClient {
  factory HomeClient(Dio dio, {String? baseUrl}) = _HomeClient;

  @GET('/api/home/user-data')
  Future<void> getApiHomeUserData();

  @GET('/api/home/home-data')
  Future<void> getApiHomeHomeData();
}
