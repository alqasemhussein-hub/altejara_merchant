// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certifecate_prices_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertifecatePricesResponse _$CertifecatePricesResponseFromJson(
  Map<String, dynamic> json,
) => CertifecatePricesResponse(
  dscrp: json['Dscrp'] as String,
  totalAmount: (json['TotalAmount'] as num).toInt(),
  prices: (json['Prices'] as List<dynamic>)
      .map((e) => Price.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CertifecatePricesResponseToJson(
  CertifecatePricesResponse instance,
) => <String, dynamic>{
  'Dscrp': instance.dscrp,
  'TotalAmount': instance.totalAmount,
  'Prices': instance.prices,
};
