import 'package:json_annotation/json_annotation.dart';

part 'add_certifecate_response.g.dart';

@JsonSerializable()
class AddCertifecateResponse {
  const AddCertifecateResponse({
    required this.id,
    required this.productDscrp,
    this.sourceCountry,
    required this.targetName,
    required this.generationDscrp,
    this.notes,
    required this.detailsDscrp,
    required this.detailsTypeDscrp,
    required this.wigth,
    required this.certificateNo,
    required this.certificateDate,
    this.targetAddress,
    required this.lang,
    required this.regNo,
    required this.regDate,
    required this.targetCountry,
    required this.tranzetCountry,
    required this.goverId,
    required this.wigthNum,
    required this.orderNo,
    required this.amount,
    this.operationId,
    required this.wigthDetails,
    this.operationName,
    required this.expDate,
    this.document,
    this.certificateId,
    this.state,
    this.oN,
    this.srialCertefecate,
    this.billDocs,
  });

  factory AddCertifecateResponse.fromJson(Map<String, Object?> json) =>
      _$AddCertifecateResponseFromJson(json);

  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'ProductDscrp')
  final String productDscrp;
  @JsonKey(name: 'TargetName')
  final String targetName;
  @JsonKey(name: 'SourceCountry')
  final dynamic sourceCountry;
  @JsonKey(name: 'GenerationDscrp')
  final String generationDscrp;
  @JsonKey(name: 'Notes')
  final String? notes;
  @JsonKey(name: 'DetailsDscrp')
  final String detailsDscrp;
  @JsonKey(name: 'DetailsTypeDscrp')
  final String detailsTypeDscrp;
  @JsonKey(name: 'Wigth')
  final String wigth;
  @JsonKey(name: 'WigthNum')
  final int wigthNum;
  @JsonKey(name: 'CertificateNo')
  final String certificateNo;
  @JsonKey(name: 'CertificateDate')
  final String certificateDate;
  @JsonKey(name: 'TargetAddress')
  final dynamic targetAddress;
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
  @JsonKey(name: 'OrderNo')
  final String orderNo;
  @JsonKey(name: 'Amount')
  final int amount;
  @JsonKey(name: 'OperationId')
  final dynamic operationId;
  @JsonKey(name: 'WigthDetails')
  final String wigthDetails;
  @JsonKey(name: 'OperationName')
  final dynamic operationName;
  @JsonKey(name: 'ExpDate')
  final String expDate;
  @JsonKey(name: 'Document')
  final dynamic document;
  @JsonKey(name: 'CertificateId')
  final dynamic certificateId;
  @JsonKey(name: 'State')
  final dynamic state;
  @JsonKey(name: 'oN')
  final dynamic oN;
  @JsonKey(name: 'srialCertefecate')
  final dynamic srialCertefecate;
  @JsonKey(name: 'BillDocs')
  final String? billDocs;

  Map<String, Object?> toJson() => _$AddCertifecateResponseToJson(this);
}
