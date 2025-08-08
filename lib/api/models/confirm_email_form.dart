// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'confirm_email_form.g.dart';

@JsonSerializable()
class ConfirmEmailForm {
  const ConfirmEmailForm({
    this.code,
    this.azbaraNumber,
  });
  
  factory ConfirmEmailForm.fromJson(Map<String, Object?> json) => _$ConfirmEmailFormFromJson(json);
  
  @JsonKey(name: 'Code')
  final String? code;
  @JsonKey(name: 'AzbaraNumber')
  final String? azbaraNumber;

  Map<String, Object?> toJson() => _$ConfirmEmailFormToJson(this);
}
