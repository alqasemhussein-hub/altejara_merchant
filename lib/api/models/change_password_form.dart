// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'change_password_form.g.dart';

@JsonSerializable()
class ChangePasswordForm {
  const ChangePasswordForm({
    this.password,
  });
  
  factory ChangePasswordForm.fromJson(Map<String, Object?> json) => _$ChangePasswordFormFromJson(json);
  
  @JsonKey(name: 'Password')
  final String? password;

  Map<String, Object?> toJson() => _$ChangePasswordFormToJson(this);
}
