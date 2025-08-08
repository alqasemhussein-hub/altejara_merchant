// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_2fa_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Verify2FaResponse _$Verify2FaResponseFromJson(Map<String, dynamic> json) =>
    Verify2FaResponse(
      id: (json['Id'] as num).toInt(),
      tajerAName: json['TajerAName'] as String,
      tajerComplementEmail: json['TajerComplementEmail'] as String?,
      token: json['Token'] as String,
      azbaraNum: json['AzbaraNum'] as String,
      fid: json['FId'] as String?,
    );

Map<String, dynamic> _$Verify2FaResponseToJson(Verify2FaResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'TajerAName': instance.tajerAName,
      'TajerComplementEmail': instance.tajerComplementEmail,
      'Token': instance.token,
      'AzbaraNum': instance.azbaraNum,
      'FId': instance.fid,
    };
