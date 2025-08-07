// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_order_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOrderForm _$UserOrderFormFromJson(Map<String, dynamic> json) =>
    UserOrderForm(
      email: json['Email'] as String?,
      name: json['Name'] as String?,
      documents: json['Documents'] as String?,
      address: json['Address'] as String?,
      jobAdressA: json['JobAdressA'] as String?,
      jobAdressE: json['JobAdressE'] as String?,
      password: json['Password'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      azbaraNum: json['AzbaraNum'] as String?,
      image: json['Image'] as String?,
      goveId: (json['GoveId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserOrderFormToJson(UserOrderForm instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'Name': instance.name,
      'Documents': instance.documents,
      'Address': instance.address,
      'JobAdressA': instance.jobAdressA,
      'JobAdressE': instance.jobAdressE,
      'Password': instance.password,
      'PhoneNumber': instance.phoneNumber,
      'AzbaraNum': instance.azbaraNum,
      'Image': instance.image,
      'GoveId': instance.goveId,
    };
