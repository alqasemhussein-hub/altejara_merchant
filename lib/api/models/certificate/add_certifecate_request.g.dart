// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_certifecate_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCertifecateRequest _$AddCertifecateRequestFromJson(
  Map<String, dynamic> json,
) => AddCertifecateRequest(
  productDscrp: json['productDscrp'] as String,
  targetName: json['targetName'] as String,
  generationDscrp: json['generationDscrp'] as String,
  detailsDscrp: json['detailsDscrp'] as String,
  detailsTypeDscrp: json['detailsTypeDscrp'] as String,
  wigth: json['wigth'] as String,
  wigthNum: (json['wigthNum'] as num).toInt(),
  certificateNo: json['certificateNo'] as String,
  certificateDate: json['certificateDate'] as String,
  lang: json['lang'] as String,
  regNo: json['regNo'] as String,
  regDate: json['regDate'] as String,
  notes: json['notes'] as String,
  targetAddress: json['targetAddress'] as String,
  serviceId: (json['serviceId'] as num).toInt(),
  expDate: json['expDate'] as String,
  itemsClassID: (json['itemsClassID'] as num).toInt(),
  countryID: (json['countryID'] as num).toInt(),
  wigthDetails: json['wigthDetails'] as String,
  billDocs: json['billDocs'] as String,
);

Map<String, dynamic> _$AddCertifecateRequestToJson(
  AddCertifecateRequest instance,
) => <String, dynamic>{
  'productDscrp': instance.productDscrp,
  'targetName': instance.targetName,
  'generationDscrp': instance.generationDscrp,
  'detailsDscrp': instance.detailsDscrp,
  'detailsTypeDscrp': instance.detailsTypeDscrp,
  'wigth': instance.wigth,
  'wigthNum': instance.wigthNum,
  'certificateNo': instance.certificateNo,
  'certificateDate': instance.certificateDate,
  'lang': instance.lang,
  'regNo': instance.regNo,
  'regDate': instance.regDate,
  'notes': instance.notes,
  'targetAddress': instance.targetAddress,
  'serviceId': instance.serviceId,
  'expDate': instance.expDate,
  'itemsClassID': instance.itemsClassID,
  'countryID': instance.countryID,
  'wigthDetails': instance.wigthDetails,
  'billDocs': instance.billDocs,
};
