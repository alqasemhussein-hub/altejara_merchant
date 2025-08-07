// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'register_form.g.dart';

@JsonSerializable()
class RegisterForm {
  const RegisterForm({
    required this.email,
    required this.password,
    this.fullName,
    this.phoneNumber,
    this.azbaraNumber,
    this.goveId,
    this.imgurl,
    this.documents,
    this.address,
    this.jobAdress,
    this.eJobAdress,
  });
  
  factory RegisterForm.fromJson(Map<String, Object?> json) => _$RegisterFormFromJson(json);
  
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'FullName')
  final String? fullName;
  @JsonKey(name: 'PhoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'AzbaraNumber')
  final String? azbaraNumber;
  @JsonKey(name: 'Password')
  final String password;
  @JsonKey(name: 'GoveId')
  final int? goveId;
  final String? imgurl;
  @JsonKey(name: 'Documents')
  final String? documents;
  @JsonKey(name: 'Address')
  final String? address;
  @JsonKey(name: 'JobAdress')
  final String? jobAdress;
  @JsonKey(name: 'EJobAdress')
  final String? eJobAdress;

  Map<String, Object?> toJson() => _$RegisterFormToJson(this);
}
