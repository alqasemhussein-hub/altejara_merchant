import 'package:freezed_annotation/freezed_annotation.dart';

part 'resend_code.g.dart';

@JsonSerializable()
class ResendCode {
  const ResendCode({this.azberNum});

  factory ResendCode.fromJson(Map<String, Object?> json) =>
      _$ResendCodeFromJson(json);

  @JsonKey(name: 'azbaraNumber')
  final String? azberNum;

  Map<String, Object?> toJson() => _$ResendCodeToJson(this);
}
