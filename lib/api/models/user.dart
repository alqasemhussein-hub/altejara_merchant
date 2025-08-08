// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.id,
    required this.name,
  });
  
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
  
  final int id;
  final String name;

  Map<String, Object?> toJson() => _$UserToJson(this);
}
