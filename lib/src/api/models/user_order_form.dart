// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'user_order_form.g.dart';

@JsonSerializable()
class UserOrderForm {
  const UserOrderForm({
    this.email,
    this.name,
    this.documents,
    this.address,
    this.jobAdressA,
    this.jobAdressE,
    this.password,
    this.phoneNumber,
    this.azbaraNum,
    this.image,
    this.goveId,
  });
  
  factory UserOrderForm.fromJson(Map<String, Object?> json) => _$UserOrderFormFromJson(json);
  
  @JsonKey(name: 'Email')
  final String? email;
  @JsonKey(name: 'Name')
  final String? name;
  @JsonKey(name: 'Documents')
  final String? documents;
  @JsonKey(name: 'Address')
  final String? address;
  @JsonKey(name: 'JobAdressA')
  final String? jobAdressA;
  @JsonKey(name: 'JobAdressE')
  final String? jobAdressE;
  @JsonKey(name: 'Password')
  final String? password;
  @JsonKey(name: 'PhoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'AzbaraNum')
  final String? azbaraNum;
  @JsonKey(name: 'Image')
  final String? image;
  @JsonKey(name: 'GoveId')
  final int? goveId;

  Map<String, Object?> toJson() => _$UserOrderFormToJson(this);
}
