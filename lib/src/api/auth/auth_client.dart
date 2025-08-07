// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/change_password_form.dart';
import '../models/confirm_email_form.dart';
import '../models/confirm_order_form.dart';
import '../models/edit_password_form.dart';
import '../models/forget_password_query.dart';
import '../models/login_form.dart';
import '../models/register_form.dart';
import '../models/tajer_filter.dart';
import '../models/user_activate_form.dart';
import '../models/user_order_form.dart';
import '../models/user_validate_form.dart';

part 'auth_client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String? baseUrl}) = _AuthClient;

  @POST('/api/auth/login')
  Future<void> postApiAuthLogin({
    @Query('whatsapp') bool? whatsapp,
    @Body() LoginForm? body,
  });

  @POST('/api/Auth/verify-2fa')
  Future<void> postApiAuthVerify2fa({
    @Query('azberNum') String? azberNum,
    @Query('code') String? code,
  });

  @POST('/api/Auth/resend-2fa-code')
  Future<void> postApiAuthResend2faCode({
    @Query('whatsapp') bool? whatsapp = false,
    @Query('azbaraNum') String? azbaraNum,
  });

  @POST('/api/auth/edit-password')
  Future<void> postApiAuthEditPassword({
    @Body() EditPasswordForm? body,
  });

  @POST('/api/auth/register')
  Future<void> postApiAuthRegister({
    @Body() RegisterForm? body,
  });

  @POST('/api/auth/check-azbara')
  Future<void> postApiAuthCheckAzbara({
    @Body() TajerFilter? body,
  });

  @POST('/api/auth/forget-password')
  Future<void> postApiAuthForgetPassword({
    @Body() ForgetPasswordQuery? body,
  });

  @POST('/api/auth/otp-verify')
  Future<void> postApiAuthOtpVerify({
    @Body() ConfirmEmailForm? body,
  });

  @POST('/api/auth/change-password')
  Future<void> postApiAuthChangePassword({
    @Body() ChangePasswordForm? body,
  });

  @POST('/api/auth/confirm-email')
  Future<void> postApiAuthConfirmEmail({
    @Body() ConfirmEmailForm? body,
  });

  @POST('/api/auth/activate-user')
  Future<void> postApiAuthActivateUser({
    @Body() UserActivateForm? body,
  });

  @MultiPart()
  @POST('/api/auth/Register-Gove')
  Future<void> postApiAuthRegisterGove({
    @Part(name: 'AzbaraNum') String? azbaraNum,
    @Part(name: 'MerchentID') String? merchentID,
    @Part(name: 'NameE') String? nameE,
    @Part(name: 'NameA') String? nameA,
    @Part(name: 'Email') String? email,
    @Part(name: 'PhoneNumber') String? phoneNumber,
    @Part(name: 'ArTitle') String? arTitle,
    @Part(name: 'Title') String? title,
    @Part(name: 'Address') String? address,
    @Part(name: 'AddressE') String? addressE,
    @Part(name: 'JobAddress') String? jobAddress,
    @Part(name: 'JobAddressE') String? jobAddressE,
    @Part(name: 'FullNameA') String? fullNameA,
    @Part(name: 'FullNameE') String? fullNameE,
    @Part(name: 'ActivityA') String? activityA,
    @Part(name: 'ActivityE') String? activityE,
    @Part(name: 'CategoryidA') String? categoryidA,
    @Part(name: 'CategoryidE') String? categoryidE,
    @Part(name: 'ClassTypeNo') String? classTypeNo,
    @Part(name: 'TradeNo') String? tradeNo,
    @Part(name: 'Regstrationdate') DateTime? regstrationdate,
    @Part(name: 'GoverID') int? goverID,
    @Part(name: 'Image') File? image,
    @Part(name: 'CreationDate') DateTime? creationDate,
  });

  @MultiPart()
  @POST('/api/auth/resend-code')
  Future<void> postApiAuthResendCode({
    @Part(name: 'azbaraNumber') String? azbaraNumber,
  });

  @MultiPart()
  @POST('/api/auth/test-tajer')
  Future<void> postApiAuthTestTajer({
    @Part(name: 'AzbaraNum') String? azbaraNum,
    @Part(name: 'MerchentID') String? merchentID,
    @Part(name: 'NameE') String? nameE,
    @Part(name: 'NameA') String? nameA,
    @Part(name: 'Email') String? email,
    @Part(name: 'PhoneNumber') String? phoneNumber,
    @Part(name: 'ArTitle') String? arTitle,
    @Part(name: 'Title') String? title,
    @Part(name: 'Address') String? address,
    @Part(name: 'AddressE') String? addressE,
    @Part(name: 'JobAddress') String? jobAddress,
    @Part(name: 'JobAddressE') String? jobAddressE,
    @Part(name: 'FullNameA') String? fullNameA,
    @Part(name: 'FullNameE') String? fullNameE,
    @Part(name: 'ActivityA') String? activityA,
    @Part(name: 'ActivityE') String? activityE,
    @Part(name: 'CategoryidA') String? categoryidA,
    @Part(name: 'CategoryidE') String? categoryidE,
    @Part(name: 'ClassTypeNo') String? classTypeNo,
    @Part(name: 'TradeNo') String? tradeNo,
    @Part(name: 'Regstrationdate') DateTime? regstrationdate,
    @Part(name: 'GoverID') int? goverID,
    @Part(name: 'TradeNumber') String? tradeNumber,
    @Part(name: 'RegistrationDate') String? registrationDate,
    @Part(name: 'Image.File') File? imageFile,
  });

  @MultiPart()
  @POST('/api/auth/create-user-by-tajer')
  Future<void> postApiAuthCreateUserByTajer({
    @Part(name: 'id') int? id,
  });

  @MultiPart()
  @POST('/api/auth/update-tajer')
  Future<void> postApiAuthUpdateTajer({
    @Part(name: 'NameE') String? nameE,
    @Part(name: 'NameA') String? nameA,
    @Part(name: 'Title') String? title,
    @Part(name: 'ArTitle') String? arTitle,
    @Part(name: 'ActivityA') String? activityA,
    @Part(name: 'ActivityE') String? activityE,
    @Part(name: 'CategoryidA') String? categoryidA,
    @Part(name: 'ClassTypeNo') String? classTypeNo,
    @Part(name: 'TradeNo') String? tradeNo,
    @Part(name: 'Email') String? email,
    @Part(name: 'GoverID') int? goverID,
    @Part(name: 'PhoneNumber') String? phoneNumber,
    @Part(name: 'Registerationdate') DateTime? registerationdate,
    @Part(name: 'Address') String? address,
    @Part(name: 'JobAddressA') String? jobAddressA,
    @Part(name: 'JobAddressE') String? jobAddressE,
    @Part(name: 'Image') File? image,
    @Part(name: 'CreationDate') DateTime? creationDate,
    @Part(name: 'id') int? id,
  });

  @GET('/api/auth/resend_password')
  Future<void> getApiAuthResendPassword({
    @Query('id') int? id,
  });

  @DELETE('/api/auth/delete-tajer-f')
  Future<void> deleteApiAuthDeleteTajerF({
    @Query('id') int? id,
  });

  @GET('/api/auth/get-classes')
  Future<void> getApiAuthGetClasses({
    @Query('id') int? id,
  });

  @POST('/api/Auth/user-validate')
  Future<void> postApiAuthUserValidate({
    @Body() UserValidateForm? body,
  });

  @DELETE('/api/auth/delete-user')
  Future<void> deleteApiAuthDeleteUser({
    @Query('id') String? id,
  });

  @POST('/api/auth/sendOrder')
  Future<void> postApiAuthSendOrder({
    @Body() UserOrderForm? body,
  });

  @POST('/api/auth/confirm_order')
  Future<void> postApiAuthConfirmOrder({
    @Body() ConfirmOrderForm? body,
  });

  @GET('/api/auth/get-orders')
  Future<void> getApiAuthGetOrders({
    @Query('page') int? page,
  });

  @GET('/api/auth/get-order')
  Future<void> getApiAuthGetOrder({
    @Query('id') int? id,
  });

  @MultiPart()
  @POST('/api/auth/accept-order')
  Future<void> postApiAuthAcceptOrder({
    @Part(name: 'id') int? id,
  });

  @MultiPart()
  @POST('/api/auth/reject-order')
  Future<void> postApiAuthRejectOrder({
    @Part(name: 'id') int? id,
  });

  @MultiPart()
  @POST('/api/auth/resend-confirmation-code')
  Future<void> postApiAuthResendConfirmationCode({
    @Part(name: 'email') String? email,
  });

  @GET('/api/auth/get-users')
  Future<void> getApiAuthGetUsers({
    @Query('Page') int? page,
  });

  @GET('/api/auth/get-user')
  Future<void> getApiAuthGetUser({
    @Query('id') int? id,
  });
}
