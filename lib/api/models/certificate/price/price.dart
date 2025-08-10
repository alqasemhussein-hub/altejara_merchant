import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable()
class Price {
  const Price({
    required this.id,
    required this.dscrp,
    required this.amount,
    required this.serviceId,
    this.service,
  });

  factory Price.fromJson(Map<String, Object?> json) => _$PriceFromJson(json);

  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'Dscrp')
  final String dscrp;
  @JsonKey(name: 'Amount')
  final int amount;
  @JsonKey(name: 'ServiceId')
  final int serviceId;
  @JsonKey(name: 'Service')
  final dynamic service;

  Map<String, Object?> toJson() => _$PriceToJson(this);
}
