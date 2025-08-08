import 'package:json_annotation/json_annotation.dart';

import 'tajer.dart';
import 'tajer_complement.dart';

part 'user_data_response.g.dart';

@JsonSerializable()
class UserDataResponse {
  const UserDataResponse({
    required this.id,
    required this.azbaraNum,
    required this.password,
    required this.tajerId,
    required this.tajer,
    required this.tajerComplementId,
    required this.tajerComplement,
    this.tajerF,
    required this.tajerFId,
    required this.passwordModifyDate,
    this.twoFactorCode,
    this.twoFactorExpiry,
    this.twoFactorEnabled,
  });

  factory UserDataResponse.fromJson(Map<String, Object?> json) =>
      _$UserDataResponseFromJson(json);

  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'AzbaraNum')
  final String azbaraNum;
  @JsonKey(name: 'Password')
  final String password;
  @JsonKey(name: 'TajerId')
  final int tajerId;
  @JsonKey(name: 'Tajer')
  final TajerModel tajer;
  @JsonKey(name: 'TajerComplementId')
  final int tajerComplementId;
  @JsonKey(name: 'TajerComplement')
  final TajerComplementModel tajerComplement;
  @JsonKey(name: 'tajerF')
  final dynamic tajerF;
  @JsonKey(name: 'tajerFId')
  final int tajerFId;
  @JsonKey(name: 'PasswordModifyDate')
  final String passwordModifyDate;
  @JsonKey(name: 'TwoFactorCode')
  final dynamic twoFactorCode;
  @JsonKey(name: 'TwoFactorExpiry')
  final dynamic twoFactorExpiry;
  @JsonKey(name: 'TwoFactorEnabled')
  final dynamic twoFactorEnabled;

  Map<String, Object?> toJson() => _$UserDataResponseToJson(this);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import
