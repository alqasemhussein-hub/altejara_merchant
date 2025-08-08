import 'package:json_annotation/json_annotation.dart';

import 'certificate_data.dart';

part 'home_data_response.g.dart';

@JsonSerializable()
class HomeDataResponse {
  const HomeDataResponse({
    this.certificateData,
    required this.booksCount,
    required this.isTajerActive,
  });

  factory HomeDataResponse.fromJson(Map<String, Object?> json) =>
      _$HomeDataResponseFromJson(json);

  @JsonKey(name: 'CertificateData')
  final CertificateData? certificateData;
  @JsonKey(name: 'BooksCount')
  final int booksCount;
  @JsonKey(name: 'IsTajerActive')
  final bool isTajerActive;

  Map<String, Object?> toJson() => _$HomeDataResponseToJson(this);
}
