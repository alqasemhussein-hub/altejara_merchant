import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_2fa_response.g.dart';

@JsonSerializable()
class Verify2FaResponse {
  const Verify2FaResponse({
    required this.id,
    required this.tajerAName,
    this.tajerComplementEmail,
    required this.token,
    required this.azbaraNum,
    this.fid,
  });

  factory Verify2FaResponse.fromJson(Map<String, Object?> json) =>
      _$Verify2FaResponseFromJson(json);

  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'TajerAName')
  final String tajerAName;
  @JsonKey(name: 'TajerComplementEmail')
  final String? tajerComplementEmail;
  @JsonKey(name: 'Token')
  final String token;
  @JsonKey(name: 'AzbaraNum')
  final String azbaraNum;
  @JsonKey(name: 'FId')
  final String? fid;

  Map<String, Object?> toJson() => _$Verify2FaResponseToJson(this);
}
