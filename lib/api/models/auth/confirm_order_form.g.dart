// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_order_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmOrderForm _$ConfirmOrderFormFromJson(Map<String, dynamic> json) =>
    ConfirmOrderForm(
      code: json['Code'] as String?,
      email: json['Email'] as String?,
    );

Map<String, dynamic> _$ConfirmOrderFormToJson(ConfirmOrderForm instance) =>
    <String, dynamic>{'Code': instance.code, 'Email': instance.email};

ConfirmOrderResponse _$ConfirmOrderResponseFromJson(
  Map<String, dynamic> json,
) => ConfirmOrderResponse(
  id: (json['Id'] as num?)?.toInt(),
  email: json['Email'] as String?,
  phoneNumber: json['PhoneNumber'] as String?,
  name: json['Name'] as String?,
  documents: json['Documents'] as String?,
  address: json['Address'] as String?,
  jobAdressA: json['JobAdressA'] as String?,
  jobAdressE: json['JobAdressE'] as String?,
  state: (json['state'] as num?)?.toInt(),
  isConfirmed: json['IsConfirmed'] as bool?,
  azbaraNum: json['AzbaraNum'] as String?,
  image: json['Image'] as String?,
  tajer: json['Tajer'] as String?,
  tajerId: (json['TajerId'] as num?)?.toInt(),
);

Map<String, dynamic> _$ConfirmOrderResponseToJson(
  ConfirmOrderResponse instance,
) => <String, dynamic>{
  'Id': instance.id,
  'Email': instance.email,
  'PhoneNumber': instance.phoneNumber,
  'Name': instance.name,
  'Documents': instance.documents,
  'Address': instance.address,
  'JobAdressA': instance.jobAdressA,
  'JobAdressE': instance.jobAdressE,
  'state': instance.state,
  'IsConfirmed': instance.isConfirmed,
  'AzbaraNum': instance.azbaraNum,
  'Image': instance.image,
  'Tajer': instance.tajer,
  'TajerId': instance.tajerId,
};
