// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'user_activate_form.g.dart';

@JsonSerializable()
class UserActivateForm {
  const UserActivateForm({
    this.userId,
  });
  
  factory UserActivateForm.fromJson(Map<String, Object?> json) => _$UserActivateFormFromJson(json);
  
  @JsonKey(name: 'UserId')
  final String? userId;

  Map<String, Object?> toJson() => _$UserActivateFormToJson(this);
}
