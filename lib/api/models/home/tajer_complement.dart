import 'package:json_annotation/json_annotation.dart';

part 'tajer_complement.g.dart';

@JsonSerializable()
class TajerComplementModel {
  const TajerComplementModel({
    required this.id,
    required this.address,
    required this.jobAddressA,
    required this.jobAddressE,
    required this.email,
    required this.phone,
    this.image,
    required this.azbaraNum,
  });

  factory TajerComplementModel.fromJson(Map<String, Object?> json) =>
      _$TajerComplementModelFromJson(json);

  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'Address')
  final String address;
  @JsonKey(name: 'JobAddressA')
  final String jobAddressA;
  @JsonKey(name: 'JobAddressE')
  final String jobAddressE;
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'Phone')
  final String phone;
  @JsonKey(name: 'Image')
  final dynamic image;
  @JsonKey(name: 'AzbaraNum')
  final String azbaraNum;

  Map<String, Object?> toJson() => _$TajerComplementModelToJson(this);
}
