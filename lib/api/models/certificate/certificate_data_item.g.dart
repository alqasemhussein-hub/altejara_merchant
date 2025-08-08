// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_data_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertifecateDataItem _$CertifecateDataItemFromJson(Map<String, dynamic> json) =>
    CertifecateDataItem(
      id: (json['Id'] as num).toInt(),
      productDscrp: json['ProductDscrp'] as String,
      targetName: json['TargetName'] as String,
      sourceCountry: json['SourceCountry'] as String,
      generationDscrp: json['GenerationDscrp'] as String,
      notes: json['Notes'] as String?,
      detailsDscrp: json['DetailsDscrp'] as String,
      detailsTypeDscrp: json['DetailsTypeDscrp'] as String,
      wigth: json['Wigth'] as String,
      certificateNo: json['CertificateNo'] as String,
      certificateDate: json['CertificateDate'] as String,
      targetAddress: json['TargetAddress'] as String,
      lang: json['Lang'] as String,
      regNo: json['RegNo'] as String,
      regDate: json['RegDate'] as String,
      targetCountry: (json['TargetCountry'] as num).toInt(),
      tranzetCountry: (json['TranzetCountry'] as num).toInt(),
      goverId: (json['GoverId'] as num).toInt(),
      wigthNum: (json['WigthNum'] as num).toDouble(),
      orderNo: json['OrderNo'] as String,
      amount: (json['Amount'] as num).toInt(),
      operationId: (json['OperationId'] as num).toInt(),
      wigthDetails: json['WigthDetails'] as String,
      operationName: json['OperationName'] as String,
      expDate: json['ExpDate'] as String,
      document: json['Document'] as String?,
      certificateId: (json['CertificateId'] as num?)?.toInt(),
      state: (json['State'] as num).toInt(),
      oN: json['oN'],
      srialCertefecate: json['srialCertefecate'],
      billDocs: json['BillDocs'] as String?,
    );

Map<String, dynamic> _$CertifecateDataItemToJson(
  CertifecateDataItem instance,
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
  'CertificateNo': instance.certificateNo,
  'CertificateDate': instance.certificateDate,
  'TargetAddress': instance.targetAddress,
  'Lang': instance.lang,
  'RegNo': instance.regNo,
  'RegDate': instance.regDate,
  'TargetCountry': instance.targetCountry,
  'TranzetCountry': instance.tranzetCountry,
  'GoverId': instance.goverId,
  'WigthNum': instance.wigthNum,
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
