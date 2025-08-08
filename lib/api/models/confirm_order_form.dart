// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'confirm_order_form.g.dart';

@JsonSerializable()
class ConfirmOrderForm {
  const ConfirmOrderForm({
    this.code,
    this.email,
  });
  
  factory ConfirmOrderForm.fromJson(Map<String, Object?> json) => _$ConfirmOrderFormFromJson(json);
  
  @JsonKey(name: 'Code')
  final String? code;
  @JsonKey(name: 'Email')
  final String? email;

  Map<String, Object?> toJson() => _$ConfirmOrderFormToJson(this);
}
