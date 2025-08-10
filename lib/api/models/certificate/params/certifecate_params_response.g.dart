// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certifecate_params_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertifecateParamsResponse _$CertifecateParamsResponseFromJson(
  Map<String, dynamic> json,
) => CertifecateParamsResponse(
  generationTypes: (json['GenerationTypes'] as List<dynamic>)
      .map((e) => GenerationType.fromJson(e as Map<String, dynamic>))
      .toList(),
  stockUnits: (json['StockUnits'] as List<dynamic>)
      .map((e) => StockUnit.fromJson(e as Map<String, dynamic>))
      .toList(),
  productTypes: (json['ProductTypes'] as List<dynamic>)
      .map((e) => ProductType.fromJson(e as Map<String, dynamic>))
      .toList(),
  itemClasses: (json['ItemClasses'] as List<dynamic>)
      .map((e) => ItemClass.fromJson(e as Map<String, dynamic>))
      .toList(),
  countries: (json['Countries'] as List<dynamic>)
      .map((e) => Country.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CertifecateParamsResponseToJson(
  CertifecateParamsResponse instance,
) => <String, dynamic>{
  'GenerationTypes': instance.generationTypes,
  'StockUnits': instance.stockUnits,
  'ProductTypes': instance.productTypes,
  'ItemClasses': instance.itemClasses,
  'Countries': instance.countries,
};
