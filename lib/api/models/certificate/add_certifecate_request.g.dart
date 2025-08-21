// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_certifecate_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCertifecateRequest _$AddCertifecateRequestFromJson(
  Map<String, dynamic> json,
) => AddCertifecateRequest(
  lang: json['Lang'] as String,
  certificateNo: json['CertificateNo'] as String,
  billDocs: json['BillDocs'] as String,
  certificateDate: json['CertificateDate'] as String,
  regNo: json['RegNo'] as String,
  regDate: json['RegDate'] as String,
  expDate: json['ExpDate'] as String,
  generationDscrp: json['GenerationDscrp'] as String,
  productDscrp: json['ProductDscrp'] as String,
  detailsDscrp: json['DetailsDscrp'] as String,
  detailsTypeDscrp: json['DetailsTypeDscrp'] as String,
  wigth: json['Wigth'] as String,
  wigthNum: (json['WigthNum'] as num).toInt(),
  wigthDetails: json['WigthDetails'] as String,
  notes: json['Notes'] as String,
  serviceId: (json['ServiceId'] as num).toInt(),
  itemsClassID: (json['ItemsClassID'] as num).toInt(),
  targetName: json['TargetName'] as String,
  targetAddress: json['TargetAddress'] as String,
  countryID: (json['CountryID'] as num).toInt(),
  countryName: json['CountryName'] as String,
  clearanceDocs: json['ClearanceDocs'] as String?,
  clearanceNo: json['ClearanceNo'] as String?,
);

Map<String, dynamic> _$AddCertifecateRequestToJson(
  AddCertifecateRequest instance,
) => <String, dynamic>{
  'Lang': instance.lang,
  'CertificateNo': instance.certificateNo,
  'BillDocs': instance.billDocs,
  'CertificateDate': instance.certificateDate,
  'RegNo': instance.regNo,
  'RegDate': instance.regDate,
  'ExpDate': instance.expDate,
  'GenerationDscrp': instance.generationDscrp,
  'ProductDscrp': instance.productDscrp,
  'DetailsDscrp': instance.detailsDscrp,
  'DetailsTypeDscrp': instance.detailsTypeDscrp,
  'Wigth': instance.wigth,
  'WigthNum': instance.wigthNum,
  'WigthDetails': instance.wigthDetails,
  'Notes': instance.notes,
  'ServiceId': instance.serviceId,
  'ItemsClassID': instance.itemsClassID,
  'TargetName': instance.targetName,
  'TargetAddress': instance.targetAddress,
  'CountryID': instance.countryID,
  'CountryName': instance.countryName,
  'ClearanceDocs': instance.clearanceDocs,
  'ClearanceNo': instance.clearanceNo,
};
