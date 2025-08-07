// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'edit_password_form.g.dart';

@JsonSerializable()
class EditPasswordForm {
  const EditPasswordForm({
    this.password,
    this.newPassword,
  });
  
  factory EditPasswordForm.fromJson(Map<String, Object?> json) => _$EditPasswordFormFromJson(json);
  
  @JsonKey(name: 'Password')
  final String? password;
  @JsonKey(name: 'NewPassword')
  final String? newPassword;

  Map<String, Object?> toJson() => _$EditPasswordFormToJson(this);
}
