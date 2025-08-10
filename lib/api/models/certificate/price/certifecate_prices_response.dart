import 'package:json_annotation/json_annotation.dart';

import 'price.dart';

part 'certifecate_prices_response.g.dart';

@JsonSerializable()
class CertifecatePricesResponse {
  const CertifecatePricesResponse({
    required this.dscrp,
    required this.totalAmount,
    required this.prices,
  });

  factory CertifecatePricesResponse.fromJson(Map<String, Object?> json) =>
      _$CertifecatePricesResponseFromJson(json);

  @JsonKey(name: 'Dscrp')
  final String dscrp;
  @JsonKey(name: 'TotalAmount')
  final int totalAmount;
  @JsonKey(name: 'Prices')
  final List<Price> prices;

  Map<String, Object?> toJson() => _$CertifecatePricesResponseToJson(this);
}
