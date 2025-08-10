// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerationType _$GenerationTypeFromJson(Map<String, dynamic> json) =>
    GenerationType(
      id: (json['Id'] as num).toInt(),
      dscrp: json['Dscrp'] as String,
    );

Map<String, dynamic> _$GenerationTypeToJson(GenerationType instance) =>
    <String, dynamic>{'Id': instance.id, 'Dscrp': instance.dscrp};
