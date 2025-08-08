import 'package:json_annotation/json_annotation.dart';

part 'add_certifecate_request.g.dart';

@JsonSerializable()
class AddCertifecateRequest {
  const AddCertifecateRequest({
    required this.productDscrp,
    required this.targetName,
    required this.generationDscrp,
    required this.detailsDscrp,
    required this.detailsTypeDscrp,
    required this.wigth,
    required this.wigthNum,
    required this.certificateNo,
    required this.certificateDate,
    required this.lang,
    required this.regNo,
    required this.regDate,
    required this.notes,
    required this.targetAddress,
    required this.serviceId,
    required this.expDate,
    required this.itemsClassID,
    required this.countryID,
    required this.wigthDetails,
    required this.billDocs,
  });

  factory AddCertifecateRequest.fromJson(Map<String, Object?> json) =>
      _$AddCertifecateRequestFromJson(json);

  final String productDscrp;
  final String targetName;
  final String generationDscrp;
  final String detailsDscrp;
  final String detailsTypeDscrp;
  final String wigth;
  final int wigthNum;
  final String certificateNo;
  final String certificateDate;
  final String lang;
  final String regNo;
  final String regDate;
  final String notes;
  final String targetAddress;
  final int serviceId;
  final String expDate;
  final int itemsClassID;
  final int countryID;
  final String wigthDetails;
  final String billDocs;

  Map<String, Object?> toJson() => _$AddCertifecateRequestToJson(this);
}
