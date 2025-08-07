// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'certifecate_form.g.dart';

@JsonSerializable()
class CertifecateForm {
  const CertifecateForm({
    this.productDscrp,
    this.targetName,
    this.generationDscrp,
    this.detailsDscrp,
    this.detailsTypeDscrp,
    this.wigth,
    this.wigthNum,
    this.certificateNo,
    this.certificateDate,
    this.lang,
    this.regNo,
    this.regDate,
    this.notes,
    this.targetAddress,
    this.serviceId,
    this.expDate,
    this.itemsClassID,
    this.countryID,
    this.wigthDetails,
    this.billDocs,
  });
  
  factory CertifecateForm.fromJson(Map<String, Object?> json) => _$CertifecateFormFromJson(json);
  
  @JsonKey(name: 'ProductDscrp')
  final String? productDscrp;
  @JsonKey(name: 'TargetName')
  final String? targetName;
  @JsonKey(name: 'GenerationDscrp')
  final String? generationDscrp;
  @JsonKey(name: 'DetailsDscrp')
  final String? detailsDscrp;
  @JsonKey(name: 'DetailsTypeDscrp')
  final String? detailsTypeDscrp;
  @JsonKey(name: 'Wigth')
  final String? wigth;
  @JsonKey(name: 'WigthNum')
  final double? wigthNum;
  @JsonKey(name: 'CertificateNo')
  final String? certificateNo;
  @JsonKey(name: 'CertificateDate')
  final DateTime? certificateDate;
  @JsonKey(name: 'Lang')
  final String? lang;
  @JsonKey(name: 'RegNo')
  final String? regNo;
  @JsonKey(name: 'RegDate')
  final DateTime? regDate;
  @JsonKey(name: 'Notes')
  final String? notes;
  @JsonKey(name: 'TargetAddress')
  final String? targetAddress;
  @JsonKey(name: 'ServiceId')
  final int? serviceId;
  @JsonKey(name: 'ExpDate')
  final DateTime? expDate;
  @JsonKey(name: 'ItemsClassID')
  final int? itemsClassID;
  @JsonKey(name: 'CountryID')
  final int? countryID;
  @JsonKey(name: 'WigthDetails')
  final String? wigthDetails;
  @JsonKey(name: 'BillDocs')
  final String? billDocs;

  Map<String, Object?> toJson() => _$CertifecateFormToJson(this);
}
