import 'package:json_annotation/json_annotation.dart';

part 'add_certifecate_request.g.dart';

@JsonSerializable()
class AddCertifecateRequest {
  const AddCertifecateRequest({
    required this.lang,
    required this.certificateNo,
    required this.billDocs,
    required this.certificateDate,
    required this.regNo,
    required this.regDate,
    required this.expDate,
    required this.generationDscrp,
    required this.productDscrp,
    required this.detailsDscrp,
    required this.detailsTypeDscrp,
    required this.wigth,
    required this.wigthNum,
    required this.wigthDetails,
    required this.notes,
    required this.serviceId,
    required this.itemsClassID,
    required this.targetName,
    required this.targetAddress,
    required this.countryID,
    required this.countryName,
  });

  factory AddCertifecateRequest.fromJson(Map<String, Object?> json) =>
      _$AddCertifecateRequestFromJson(json);

  @JsonKey(name: 'Lang')
  final String lang;
  @JsonKey(name: 'CertificateNo')
  final String certificateNo;
  @JsonKey(name: 'BillDocs')
  final String billDocs;
  @JsonKey(name: 'CertificateDate')
  final String certificateDate;
  @JsonKey(name: 'RegNo')
  final String regNo;
  @JsonKey(name: 'RegDate')
  final String regDate;
  @JsonKey(name: 'ExpDate')
  final String expDate;
  @JsonKey(name: 'GenerationDscrp')
  final String generationDscrp;
  @JsonKey(name: 'ProductDscrp')
  final String productDscrp;
  @JsonKey(name: 'DetailsDscrp')
  final String detailsDscrp;
  @JsonKey(name: 'DetailsTypeDscrp')
  final String detailsTypeDscrp;
  @JsonKey(name: 'Wigth')
  final String wigth;
  @JsonKey(name: 'WigthNum')
  final String wigthNum;
  @JsonKey(name: 'WigthDetails')
  final String wigthDetails;
  @JsonKey(name: 'Notes')
  final String notes;
  @JsonKey(name: 'ServiceId')
  final String serviceId;
  @JsonKey(name: 'ItemsClassID')
  final String itemsClassID;
  @JsonKey(name: 'TargetName')
  final String targetName;
  @JsonKey(name: 'TargetAddress')
  final String targetAddress;
  @JsonKey(name: 'CountryID')
  final String countryID;
  @JsonKey(name: 'CountryName')
  final String countryName;

  Map<String, Object?> toJson() => _$AddCertifecateRequestToJson(this);
}
