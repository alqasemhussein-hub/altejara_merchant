// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_certifecate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCertifecateResponse _$AddCertifecateResponseFromJson(
  Map<String, dynamic> json,
) => AddCertifecateResponse(
  id: (json['Id'] as num).toInt(),
  productDscrp: json['ProductDscrp'] as String,
  sourceCountry: json['SourceCountry'],
  targetName: json['TargetName'] as String,
  generationDscrp: json['GenerationDscrp'] as String,
  notes: json['Notes'] as String?,
  detailsDscrp: json['DetailsDscrp'] as String,
  detailsTypeDscrp: json['DetailsTypeDscrp'] as String,
  wigth: json['Wigth'] as String,
  certificateNo: json['CertificateNo'] as String,
  certificateDate: json['CertificateDate'] as String,
  targetAddress: json['TargetAddress'],
  lang: json['Lang'] as String,
  regNo: json['RegNo'] as String,
  regDate: json['RegDate'] as String,
  targetCountry: (json['TargetCountry'] as num).toInt(),
  tranzetCountry: (json['TranzetCountry'] as num).toInt(),
  goverId: (json['GoverId'] as num).toInt(),
  wigthNum: (json['WigthNum'] as num).toInt(),
  orderNo: json['OrderNo'] as String,
  amount: (json['Amount'] as num).toInt(),
  operationId: json['OperationId'],
  wigthDetails: json['WigthDetails'] as String,
  operationName: json['OperationName'],
  expDate: json['ExpDate'] as String,
  document: json['Document'],
  certificateId: json['CertificateId'],
  state: json['State'],
  oN: json['oN'],
  srialCertefecate: json['srialCertefecate'],
  billDocs: json['BillDocs'] as String?,
);

Map<String, dynamic> _$AddCertifecateResponseToJson(
  AddCertifecateResponse instance,
) => <String, dynamic>{
  'Id': instance.id,
  'ProductDscrp': instance.productDscrp,
  'TargetName': instance.targetName,
  'SourceCountry': instance.sourceCountry,
  'GenerationDscrp': instance.generationDscrp,
  'Notes': instance.notes,
  'DetailsDscrp': instance.detailsDscrp,
  'DetailsTypeDscrp': instance.detailsTypeDscrp,
  'Wigth': instance.wigth,
  'WigthNum': instance.wigthNum,
  'CertificateNo': instance.certificateNo,
  'CertificateDate': instance.certificateDate,
  'TargetAddress': instance.targetAddress,
  'Lang': instance.lang,
  'RegNo': instance.regNo,
  'RegDate': instance.regDate,
  'TargetCountry': instance.targetCountry,
  'TranzetCountry': instance.tranzetCountry,
  'GoverId': instance.goverId,
  'OrderNo': instance.orderNo,
  'Amount': instance.amount,
  'OperationId': instance.operationId,
  'WigthDetails': instance.wigthDetails,
  'OperationName': instance.operationName,
  'ExpDate': instance.expDate,
  'Document': instance.document,
  'CertificateId': instance.certificateId,
  'State': instance.state,
  'oN': instance.oN,
  'srialCertefecate': instance.srialCertefecate,
  'BillDocs': instance.billDocs,
};
