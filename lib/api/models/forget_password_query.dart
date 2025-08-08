// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'forget_password_query.g.dart';

@JsonSerializable()
class ForgetPasswordQuery {
  const ForgetPasswordQuery({
    this.azbaraNumber,
    this.isWhatsApp,
  });
  
  factory ForgetPasswordQuery.fromJson(Map<String, Object?> json) => _$ForgetPasswordQueryFromJson(json);
  
  @JsonKey(name: 'AzbaraNumber')
  final String? azbaraNumber;
  @JsonKey(name: 'IsWhatsApp')
  final bool? isWhatsApp;

  Map<String, Object?> toJson() => _$ForgetPasswordQueryToJson(this);
}
