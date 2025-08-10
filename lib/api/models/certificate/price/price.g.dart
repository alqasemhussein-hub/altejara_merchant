// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
  id: (json['Id'] as num).toInt(),
  dscrp: json['Dscrp'] as String,
  amount: (json['Amount'] as num).toInt(),
  serviceId: (json['ServiceId'] as num).toInt(),
  service: json['Service'],
);

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
  'Id': instance.id,
  'Dscrp': instance.dscrp,
  'Amount': instance.amount,
  'ServiceId': instance.serviceId,
  'Service': instance.service,
};
