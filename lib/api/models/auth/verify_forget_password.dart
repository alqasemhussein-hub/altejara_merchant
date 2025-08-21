import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_forget_password.g.dart';

@JsonSerializable()
class VerifyForgetPasswordForm {
  const VerifyForgetPasswordForm({this.azberNum, this.code});

  factory VerifyForgetPasswordForm.fromJson(Map<String, Object?> json) =>
      _$VerifyForgetPasswordFormFromJson(json);

  @JsonKey(name: 'Code')
  final String? code;
  @JsonKey(name: 'AzbaraNumber')
  final String? azberNum;

  Map<String, Object?> toJson() => _$VerifyForgetPasswordFormToJson(this);
}
