// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'dictionarybase.g.dart';

@JsonSerializable()
class Dictionarybase {
  const Dictionarybase({
    this.base64,
  });
  
  factory Dictionarybase.fromJson(Map<String, Object?> json) => _$DictionarybaseFromJson(json);
  
  final String? base64;

  Map<String, Object?> toJson() => _$DictionarybaseToJson(this);
}
