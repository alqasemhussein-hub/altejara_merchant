// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'login_form.g.dart';

@JsonSerializable()
class LoginForm {
  const LoginForm({
    required this.azbaraNum,
    required this.password,
  });
  
  factory LoginForm.fromJson(Map<String, Object?> json) => _$LoginFormFromJson(json);
  
  final String azbaraNum;
  final String password;

  Map<String, Object?> toJson() => _$LoginFormToJson(this);
}
