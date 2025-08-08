// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:techara_merchant/api/models/verify_2fa_response.dart';

import '../models/change_password_form.dart';
import '../models/confirm_email_form.dart';
import '../models/confirm_order_form.dart';
import '../models/edit_password_form.dart';
import '../models/forget_password_query.dart';
import '../models/login_form.dart';
import '../models/login_response.dart';
import '../models/register_form.dart';
import '../models/tajer_filter.dart';
import '../models/user_activate_form.dart';
import '../models/user_order_form.dart';
import '../models/user_validate_form.dart';

part 'auth_client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String? baseUrl}) = _AuthClient;

  /// Login
  @POST('/api/auth/login')
  Future<LoginResponse> postApiAuthLogin({
    @Body() required LoginForm body,
    @Query('whatsapp') bool? whatsapp,
  });

  /// Verify 2FA
  @POST('/api/Auth/verify-2fa')
  Future<Verify2FaResponse> postApiAuthVerify2fa({
    @Query('azberNum') required String azberNum,
    @Query('code') required String code,
  });
  @POST('/api/Auth/resend-2fa-code')
  Future<void> postApiAuthResend2faCode({
    @Query('azbaraNum') required String azbaraNum,
    @Query('whatsapp') bool? whatsapp = false,
  });
  @POST('/api/auth/edit-password')
  Future<void> postApiAuthEditPassword({
    @Body() required EditPasswordForm body,
  });
}
