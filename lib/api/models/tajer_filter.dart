// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'tajer_filter.g.dart';

@JsonSerializable()
class TajerFilter {
  const TajerFilter({
    this.azbararNum,
  });
  
  factory TajerFilter.fromJson(Map<String, Object?> json) => _$TajerFilterFromJson(json);
  
  @JsonKey(name: 'AzbararNum')
  final String? azbararNum;

  Map<String, Object?> toJson() => _$TajerFilterToJson(this);
}
