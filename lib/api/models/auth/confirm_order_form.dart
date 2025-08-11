import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirm_order_form.g.dart';

@JsonSerializable()
class ConfirmOrderForm {
  const ConfirmOrderForm({this.code, this.email});

  factory ConfirmOrderForm.fromJson(Map<String, Object?> json) =>
      _$ConfirmOrderFormFromJson(json);

  @JsonKey(name: 'Code')
  final String? code;
  @JsonKey(name: 'Email')
  final String? email;

  Map<String, Object?> toJson() => _$ConfirmOrderFormToJson(this);
}

@JsonSerializable()
class ConfirmOrderResponse {
  const ConfirmOrderResponse({
    this.id,
    this.email,
    this.phoneNumber,
    this.name,
    this.documents,
    this.address,
    this.jobAdressA,
    this.jobAdressE,
    this.state,
    this.isConfirmed,
    this.azbaraNum,
    this.image,
    this.tajer,
    this.tajerId,
  });

  factory ConfirmOrderResponse.fromJson(Map<String, Object?> json) =>
      _$ConfirmOrderResponseFromJson(json);

  @JsonKey(name: 'Id')
  final int? id;
  @JsonKey(name: 'Email')
  final String? email;
  @JsonKey(name: 'PhoneNumber')
  final String? phoneNumber;
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
  @JsonKey(name: 'state')
  final int? state;
  @JsonKey(name: 'IsConfirmed')
  final bool? isConfirmed;
  @JsonKey(name: 'AzbaraNum')
  final String? azbaraNum;
  @JsonKey(name: 'Image')
  final String? image;
  @JsonKey(name: 'Tajer')
  final String? tajer;
  @JsonKey(name: 'TajerId')
  final int? tajerId;

  Map<String, Object?> toJson() => _$ConfirmOrderResponseToJson(this);
}
