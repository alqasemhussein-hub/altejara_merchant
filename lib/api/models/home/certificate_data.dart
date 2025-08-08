import 'package:json_annotation/json_annotation.dart';

part 'certificate_data.g.dart';

@JsonSerializable()
class CertificateData {
  const CertificateData({
    required this.certificates,
    required this.acceptedCount,
    required this.rejectedCount,
    required this.pendingCount,
    required this.suspendedCount,
    required this.certificatesCount,
  });

  factory CertificateData.fromJson(Map<String, Object?> json) =>
      _$CertificateDataFromJson(json);

  @JsonKey(name: 'Certificates')
  final List<Certificate> certificates;
  @JsonKey(name: 'AcceptedCount')
  final int acceptedCount;
  @JsonKey(name: 'RejectedCount')
  final int rejectedCount;
  @JsonKey(name: 'PendingCount')
  final int pendingCount;
  @JsonKey(name: 'SuspendedCount')
  final int suspendedCount;
  @JsonKey(name: 'CertificatesCount')
  final int certificatesCount;

  Map<String, Object?> toJson() => _$CertificateDataToJson(this);
}

@JsonSerializable()
class Certificate {
  const Certificate({
    required this.id,
    required this.sourceName,
    required this.productDscrp,
    required this.targetName,
    required this.sourceCountry,
    required this.generationDscrp,
    required this.notes,
    required this.detailsDscrp,
    required this.detailsTypeDscrp,
    required this.wigth,
    required this.certificateNo,
    required this.certificateDate,
    this.createdBy,
    required this.createdDate,
    required this.sourceAdress,
    required this.targetAddress,
    required this.placement,
    required this.referenceNo,
    required this.referenceDate,
    required this.aZbaraNum,
    required this.managerName,
    required this.lang,
    required this.regNo,
    required this.regDate,
    this.targetCountry,
    this.tranzetCountry,
    required this.wigthNum,
    this.wigthDscrp,
    required this.goverId,
    required this.operationId,
    required this.orderNo,
    required this.itemsClassID,
    required this.countryID,
    required this.regExpireDate,
    required this.wigthDetails,
    this.billDocs,
  });

  factory Certificate.fromJson(Map<String, Object?> json) =>
      _$CertificateFromJson(json);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'SourceName')
  final String sourceName;
  @JsonKey(name: 'ProductDscrp')
  final String productDscrp;
  @JsonKey(name: 'TargetName')
  final String targetName;
  @JsonKey(name: 'SourceCountry')
  final String sourceCountry;
  @JsonKey(name: 'GenerationDscrp')
  final String generationDscrp;
  @JsonKey(name: 'Notes')
  final String notes;
  @JsonKey(name: 'DetailsDscrp')
  final String detailsDscrp;
  @JsonKey(name: 'DetailsTypeDscrp')
  final String detailsTypeDscrp;
  @JsonKey(name: 'Wigth')
  final String wigth;
  @JsonKey(name: 'CertificateNo')
  final String certificateNo;
  @JsonKey(name: 'CertificateDate')
  final String certificateDate;
  @JsonKey(name: 'CreatedBy')
  final dynamic createdBy;
  @JsonKey(name: 'CreatedDate')
  final String createdDate;
  @JsonKey(name: 'SourceAdress')
  final String sourceAdress;
  @JsonKey(name: 'TargetAddress')
  final String targetAddress;
  @JsonKey(name: 'Placement')
  final String placement;
  @JsonKey(name: 'ReferenceNo')
  final String? referenceNo;
  @JsonKey(name: 'ReferenceDate')
  final String? referenceDate;
  @JsonKey(name: 'AZbaraNum')
  final String aZbaraNum;
  @JsonKey(name: 'ManagerName')
  final String managerName;
  @JsonKey(name: 'Lang')
  final String lang;
  @JsonKey(name: 'RegNo')
  final String regNo;
  @JsonKey(name: 'RegDate')
  final String regDate;
  @JsonKey(name: 'TargetCountry')
  final dynamic targetCountry;
  @JsonKey(name: 'TranzetCountry')
  final dynamic tranzetCountry;
  @JsonKey(name: 'WigthNum')
  final double wigthNum;
  @JsonKey(name: 'WigthDscrp')
  final dynamic wigthDscrp;
  @JsonKey(name: 'GoverId')
  final int goverId;
  @JsonKey(name: 'OperationId')
  final int operationId;
  @JsonKey(name: 'OrderNo')
  final String orderNo;
  @JsonKey(name: 'ItemsClassID')
  final int itemsClassID;
  @JsonKey(name: 'CountryID')
  final int countryID;
  @JsonKey(name: 'RegExpireDate')
  final String regExpireDate;
  @JsonKey(name: 'WigthDetails')
  final String wigthDetails;
  @JsonKey(name: 'BillDocs')
  final dynamic billDocs;

  Map<String, Object?> toJson() => _$CertificateToJson(this);
}
