// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      id: (json['Id'] as num).toInt(),
      azbaraNum: json['AzbaraNum'] as String,
      password: json['Password'] as String,
      tajerId: (json['TajerId'] as num).toInt(),
      tajer: TajerModel.fromJson(json['Tajer'] as Map<String, dynamic>),
      tajerComplementId: (json['TajerComplementId'] as num).toInt(),
      tajerComplement: TajerComplementModel.fromJson(
        json['TajerComplement'] as Map<String, dynamic>,
      ),
      tajerF: json['tajerF'],
      tajerFId: (json['tajerFId'] as num).toInt(),
      passwordModifyDate: json['PasswordModifyDate'] as String,
      twoFactorCode: json['TwoFactorCode'],
      twoFactorExpiry: json['TwoFactorExpiry'],
      twoFactorEnabled: json['TwoFactorEnabled'],
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'AzbaraNum': instance.azbaraNum,
      'Password': instance.password,
      'TajerId': instance.tajerId,
      'Tajer': instance.tajer,
      'TajerComplementId': instance.tajerComplementId,
      'TajerComplement': instance.tajerComplement,
      'tajerF': instance.tajerF,
      'tajerFId': instance.tajerFId,
      'PasswordModifyDate': instance.passwordModifyDate,
      'TwoFactorCode': instance.twoFactorCode,
      'TwoFactorExpiry': instance.twoFactorExpiry,
      'TwoFactorEnabled': instance.twoFactorEnabled,
    };
