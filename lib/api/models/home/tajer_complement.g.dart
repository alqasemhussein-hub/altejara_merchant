// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tajer_complement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TajerComplementModel _$TajerComplementModelFromJson(
  Map<String, dynamic> json,
) => TajerComplementModel(
  id: (json['Id'] as num).toInt(),
  address: json['Address'] as String,
  jobAddressA: json['JobAddressA'] as String,
  jobAddressE: json['JobAddressE'] as String,
  email: json['Email'] as String,
  phone: json['Phone'] as String,
  image: json['Image'],
  azbaraNum: json['AzbaraNum'] as String,
);

Map<String, dynamic> _$TajerComplementModelToJson(
  TajerComplementModel instance,
) => <String, dynamic>{
  'Id': instance.id,
  'Address': instance.address,
  'JobAddressA': instance.jobAddressA,
  'JobAddressE': instance.jobAddressE,
  'Email': instance.email,
  'Phone': instance.phone,
  'Image': instance.image,
  'AzbaraNum': instance.azbaraNum,
};
