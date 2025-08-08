// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'login_error.g.dart';

@JsonSerializable()
class LoginError {
  const LoginError({
    this.statusCode,
    this.message,
    this.content,
  });
  
  factory LoginError.fromJson(Map<String, Object?> json) => _$LoginErrorFromJson(json);
  
  final int? statusCode;
  final String? message;
  final String? content;

  Map<String, Object?> toJson() => _$LoginErrorToJson(this);
}
