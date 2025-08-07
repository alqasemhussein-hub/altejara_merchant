// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'login_form.g.dart';

@JsonSerializable()
class LoginForm {
  const LoginForm({
    required this.password,
    this.azbaraNum,
  });
  
  factory LoginForm.fromJson(Map<String, Object?> json) => _$LoginFormFromJson(json);
  
  @JsonKey(name: 'Password')
  final String password;
  @JsonKey(name: 'AzbaraNum')
  final String? azbaraNum;

  Map<String, Object?> toJson() => _$LoginFormToJson(this);
}
