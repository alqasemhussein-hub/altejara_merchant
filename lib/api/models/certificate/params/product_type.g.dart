// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductType _$ProductTypeFromJson(Map<String, dynamic> json) => ProductType(
  id: (json['Id'] as num).toInt(),
  dscrp: json['Dscrp'] as String,
);

Map<String, dynamic> _$ProductTypeToJson(ProductType instance) =>
    <String, dynamic>{'Id': instance.id, 'Dscrp': instance.dscrp};
