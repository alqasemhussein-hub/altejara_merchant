import 'package:json_annotation/json_annotation.dart';

part 'certificate_data_item.g.dart';

@JsonSerializable()
class CertifecateDataItem {
  const CertifecateDataItem({
    required this.id,
    required this.productDscrp,
    required this.targetName,
    required this.sourceCountry,
    required this.generationDscrp,
    this.notes,
    required this.detailsDscrp,
    required this.detailsTypeDscrp,
    required this.wigth,
    required this.certificateNo,
    required this.certificateDate,
    required this.targetAddress,
    required this.lang,
    required this.regNo,
    required this.regDate,
    required this.targetCountry,
    required this.tranzetCountry,
    required this.goverId,
    required this.wigthNum,
    required this.orderNo,
    required this.amount,
    required this.operationId,
    required this.wigthDetails,
    required this.operationName,
    required this.expDate,
    this.document,
    required this.certificateId,
    required this.state,
    this.oN,
    this.srialCertefecate,
    this.billDocs,
  });

  factory CertifecateDataItem.fromJson(Map<String, Object?> json) =>
      _$CertifecateDataItemFromJson(json);

  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'ProductDscrp')
  final String? productDscrp;
  @JsonKey(name: 'TargetName')
  final String? targetName;
  @JsonKey(name: 'SourceCountry')
  final String sourceCountry;
  @JsonKey(name: 'GenerationDscrp')
  final String? generationDscrp;
  @JsonKey(name: 'Notes')
  final String? notes;
  @JsonKey(name: 'DetailsDscrp')
  final String? detailsDscrp;
  @JsonKey(name: 'DetailsTypeDscrp')
  final String? detailsTypeDscrp;
  @JsonKey(name: 'Wigth')
  final String wigth;
  @JsonKey(name: 'CertificateNo')
  final String certificateNo;
  @JsonKey(name: 'CertificateDate')
  final String certificateDate;
  @JsonKey(name: 'TargetAddress')
  final String targetAddress;
  @JsonKey(name: 'Lang')
  final String lang;
  @JsonKey(name: 'RegNo')
  final String regNo;
  @JsonKey(name: 'RegDate')
  final String regDate;
  @JsonKey(name: 'TargetCountry')
  final int targetCountry;
  @JsonKey(name: 'TranzetCountry')
  final int tranzetCountry;
  @JsonKey(name: 'GoverId')
  final int goverId;
  @JsonKey(name: 'WigthNum')
  final double? wigthNum;
  @JsonKey(name: 'OrderNo')
  final String? orderNo;
  @JsonKey(name: 'Amount')
  final int amount;
  @JsonKey(name: 'OperationId')
  final int operationId;
  @JsonKey(name: 'WigthDetails')
  final String? wigthDetails;
  @JsonKey(name: 'OperationName')
  final String? operationName;
  @JsonKey(name: 'ExpDate')
  final String expDate;
  @JsonKey(name: 'Document')
  final String? document;
  @JsonKey(name: 'CertificateId')
  final int? certificateId;
  @JsonKey(name: 'State')
  final int state;
  @JsonKey(name: 'oN')
  final dynamic oN;
  @JsonKey(name: 'srialCertefecate')
  final dynamic srialCertefecate;
  @JsonKey(name: 'BillDocs')
  final String? billDocs;

  Map<String, Object?> toJson() => _$CertifecateDataItemToJson(this);
}
