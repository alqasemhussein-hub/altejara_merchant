// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificateData _$CertificateDataFromJson(Map<String, dynamic> json) =>
    CertificateData(
      certificates: (json['Certificates'] as List<dynamic>)
          .map((e) => Certificate.fromJson(e as Map<String, dynamic>))
          .toList(),
      acceptedCount: (json['AcceptedCount'] as num).toInt(),
      rejectedCount: (json['RejectedCount'] as num).toInt(),
      pendingCount: (json['PendingCount'] as num).toInt(),
      suspendedCount: (json['SuspendedCount'] as num).toInt(),
      certificatesCount: (json['CertificatesCount'] as num).toInt(),
    );

Map<String, dynamic> _$CertificateDataToJson(CertificateData instance) =>
    <String, dynamic>{
      'Certificates': instance.certificates,
      'AcceptedCount': instance.acceptedCount,
      'RejectedCount': instance.rejectedCount,
      'PendingCount': instance.pendingCount,
      'SuspendedCount': instance.suspendedCount,
      'CertificatesCount': instance.certificatesCount,
    };

Certificate _$CertificateFromJson(Map<String, dynamic> json) => Certificate(
  id: (json['id'] as num).toInt(),
  sourceName: json['SourceName'] as String,
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
  createdBy: json['CreatedBy'],
  createdDate: json['CreatedDate'] as String,
  sourceAdress: json['SourceAdress'] as String,
  targetAddress: json['TargetAddress'] as String,
  placement: json['Placement'] as String,
  referenceNo: json['ReferenceNo'] as String?,
  referenceDate: json['ReferenceDate'] as String?,
  aZbaraNum: json['AZbaraNum'] as String,
  managerName: json['ManagerName'] as String,
  lang: json['Lang'] as String,
  regNo: json['RegNo'] as String,
  regDate: json['RegDate'] as String,
  targetCountry: json['TargetCountry'],
  tranzetCountry: json['TranzetCountry'],
  wigthNum: (json['WigthNum'] as num).toDouble(),
  wigthDscrp: json['WigthDscrp'],
  goverId: (json['GoverId'] as num).toInt(),
  operationId: (json['OperationId'] as num).toInt(),
  orderNo: json['OrderNo'] as String,
  itemsClassID: (json['ItemsClassID'] as num).toInt(),
  countryID: (json['CountryID'] as num).toInt(),
  regExpireDate: json['RegExpireDate'] as String,
  wigthDetails: json['WigthDetails'] as String?,
  billDocs: json['BillDocs'],
);

Map<String, dynamic> _$CertificateToJson(Certificate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'SourceName': instance.sourceName,
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
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'SourceAdress': instance.sourceAdress,
      'TargetAddress': instance.targetAddress,
      'Placement': instance.placement,
      'ReferenceNo': instance.referenceNo,
      'ReferenceDate': instance.referenceDate,
      'AZbaraNum': instance.aZbaraNum,
      'ManagerName': instance.managerName,
      'Lang': instance.lang,
      'RegNo': instance.regNo,
      'RegDate': instance.regDate,
      'TargetCountry': instance.targetCountry,
      'TranzetCountry': instance.tranzetCountry,
      'WigthNum': instance.wigthNum,
      'WigthDscrp': instance.wigthDscrp,
      'GoverId': instance.goverId,
      'OperationId': instance.operationId,
      'OrderNo': instance.orderNo,
      'ItemsClassID': instance.itemsClassID,
      'CountryID': instance.countryID,
      'RegExpireDate': instance.regExpireDate,
      'WigthDetails': instance.wigthDetails,
      'BillDocs': instance.billDocs,
    };
