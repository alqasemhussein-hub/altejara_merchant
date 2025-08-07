// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterForm _$RegisterFormFromJson(Map<String, dynamic> json) => RegisterForm(
  email: json['Email'] as String,
  password: json['Password'] as String,
  fullName: json['FullName'] as String?,
  phoneNumber: json['PhoneNumber'] as String?,
  azbaraNumber: json['AzbaraNumber'] as String?,
  goveId: (json['GoveId'] as num?)?.toInt(),
  imgurl: json['imgurl'] as String?,
  documents: json['Documents'] as String?,
  address: json['Address'] as String?,
  jobAdress: json['JobAdress'] as String?,
  eJobAdress: json['EJobAdress'] as String?,
);

Map<String, dynamic> _$RegisterFormToJson(RegisterForm instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'FullName': instance.fullName,
      'PhoneNumber': instance.phoneNumber,
      'AzbaraNumber': instance.azbaraNumber,
      'Password': instance.password,
      'GoveId': instance.goveId,
      'imgurl': instance.imgurl,
      'Documents': instance.documents,
      'Address': instance.address,
      'JobAdress': instance.jobAdress,
      'EJobAdress': instance.eJobAdress,
    };
