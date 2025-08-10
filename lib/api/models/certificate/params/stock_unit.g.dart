// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockUnit _$StockUnitFromJson(Map<String, dynamic> json) =>
    StockUnit(id: (json['Id'] as num).toInt(), dscrp: json['Dscrp'] as String);

Map<String, dynamic> _$StockUnitToJson(StockUnit instance) => <String, dynamic>{
  'Id': instance.id,
  'Dscrp': instance.dscrp,
};
