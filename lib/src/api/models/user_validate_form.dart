// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'user_validate_form.g.dart';

@JsonSerializable()
class UserValidateForm {
  const UserValidateForm({
    this.email,
    this.phoneNumber,
  });
  
  factory UserValidateForm.fromJson(Map<String, Object?> json) => _$UserValidateFormFromJson(json);
  
  @JsonKey(name: 'Email')
  final String? email;
  @JsonKey(name: 'PhoneNumber')
  final String? phoneNumber;

  Map<String, Object?> toJson() => _$UserValidateFormToJson(this);
}
