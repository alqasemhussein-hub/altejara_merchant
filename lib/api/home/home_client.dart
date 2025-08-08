// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:techara_merchant/api/models/home/home_data_response.dart';
import 'package:techara_merchant/api/models/home/user_data_response.dart';

part 'home_client.g.dart';

@RestApi()
abstract class HomeClient {
  factory HomeClient(Dio dio, {String? baseUrl}) = _HomeClient;

  @GET('/api/home/home-data')
  Future<HomeDataResponse> getApiHomeHomeData();

  /// Get User Data
  @GET('/api/home/user-data')
  Future<UserDataResponse> getApiHomeUserData();
}
