import 'package:json_annotation/json_annotation.dart';

part 'tajer_data_response.g.dart';

@JsonSerializable()
class TajerDataResponse {
  const TajerDataResponse({
    required this.azbaraNumber,
    required this.companyName,
    required this.managerName,
    required this.companyAddress,
    required this.lang,
  });

  factory TajerDataResponse.fromJson(Map<String, Object?> json) =>
      _$TajerDataResponseFromJson(json);

  @JsonKey(name: 'AzbaraNumber')
  final String azbaraNumber;
  @JsonKey(name: 'CompanyName')
  final String companyName;
  @JsonKey(name: 'ManagerName')
  final String managerName;
  @JsonKey(name: 'CompanyAddress')
  final String companyAddress;
  @JsonKey(name: 'lang')
  final String lang;

  Map<String, Object?> toJson() => _$TajerDataResponseToJson(this);
}
