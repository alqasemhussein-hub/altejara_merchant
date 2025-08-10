// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemClass _$ItemClassFromJson(Map<String, dynamic> json) => ItemClass(
  id: (json['id'] as num).toInt(),
  dscrpA: json['DscrpA'] as String,
  dscrpE: json['DscrpE'] as String,
);

Map<String, dynamic> _$ItemClassToJson(ItemClass instance) => <String, dynamic>{
  'id': instance.id,
  'DscrpA': instance.dscrpA,
  'DscrpE': instance.dscrpE,
};
