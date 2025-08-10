// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
  id: (json['id'] as num).toInt(),
  dscrpA: json['DscrpA'] as String,
  dscrpE: json['DscrpE'] as String,
);

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
  'id': instance.id,
  'DscrpA': instance.dscrpA,
  'DscrpE': instance.dscrpE,
};
