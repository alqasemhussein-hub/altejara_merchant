// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certifecate_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertifecateForm _$CertifecateFormFromJson(Map<String, dynamic> json) =>
    CertifecateForm(
      productDscrp: json['ProductDscrp'] as String?,
      targetName: json['TargetName'] as String?,
      generationDscrp: json['GenerationDscrp'] as String?,
      detailsDscrp: json['DetailsDscrp'] as String?,
      detailsTypeDscrp: json['DetailsTypeDscrp'] as String?,
      wigth: json['Wigth'] as String?,
      wigthNum: (json['WigthNum'] as num?)?.toDouble(),
      certificateNo: json['CertificateNo'] as String?,
      certificateDate: json['CertificateDate'] == null
          ? null
          : DateTime.parse(json['CertificateDate'] as String),
      lang: json['Lang'] as String?,
      regNo: json['RegNo'] as String?,
      regDate: json['RegDate'] == null
          ? null
          : DateTime.parse(json['RegDate'] as String),
      notes: json['Notes'] as String?,
      targetAddress: json['TargetAddress'] as String?,
      serviceId: (json['ServiceId'] as num?)?.toInt(),
      expDate: json['ExpDate'] == null
          ? null
          : DateTime.parse(json['ExpDate'] as String),
      itemsClassID: (json['ItemsClassID'] as num?)?.toInt(),
      countryID: (json['CountryID'] as num?)?.toInt(),
      wigthDetails: json['WigthDetails'] as String?,
      billDocs: json['BillDocs'] as String?,
    );

Map<String, dynamic> _$CertifecateFormToJson(CertifecateForm instance) =>
    <String, dynamic>{
      'ProductDscrp': instance.productDscrp,
      'TargetName': instance.targetName,
      'GenerationDscrp': instance.generationDscrp,
      'DetailsDscrp': instance.detailsDscrp,
      'DetailsTypeDscrp': instance.detailsTypeDscrp,
      'Wigth': instance.wigth,
      'WigthNum': instance.wigthNum,
      'CertificateNo': instance.certificateNo,
      'CertificateDate': instance.certificateDate?.toIso8601String(),
      'Lang': instance.lang,
      'RegNo': instance.regNo,
      'RegDate': instance.regDate?.toIso8601String(),
      'Notes': instance.notes,
      'TargetAddress': instance.targetAddress,
      'ServiceId': instance.serviceId,
      'ExpDate': instance.expDate?.toIso8601String(),
      'ItemsClassID': instance.itemsClassID,
      'CountryID': instance.countryID,
      'WigthDetails': instance.wigthDetails,
      'BillDocs': instance.billDocs,
    };
