// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tajer_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TajerDataResponse _$TajerDataResponseFromJson(Map<String, dynamic> json) =>
    TajerDataResponse(
      azbaraNumber: json['AzbaraNumber'] as String,
      companyName: json['CompanyName'] as String,
      managerName: json['ManagerName'] as String,
      companyAddress: json['CompanyAddress'] as String,
      lang: json['lang'] as String,
    );

Map<String, dynamic> _$TajerDataResponseToJson(TajerDataResponse instance) =>
    <String, dynamic>{
      'AzbaraNumber': instance.azbaraNumber,
      'CompanyName': instance.companyName,
      'ManagerName': instance.managerName,
      'CompanyAddress': instance.companyAddress,
      'lang': instance.lang,
    };
