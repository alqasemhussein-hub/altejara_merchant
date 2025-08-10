import 'package:json_annotation/json_annotation.dart';

import 'country.dart';
import 'generation_type.dart';
import 'item_class.dart';
import 'product_type.dart';
import 'stock_unit.dart';

part 'certifecate_params_response.g.dart';

@JsonSerializable()
class CertifecateParamsResponse {
  const CertifecateParamsResponse({
    required this.generationTypes,
    required this.stockUnits,
    required this.productTypes,
    required this.itemClasses,
    required this.countries,
  });

  factory CertifecateParamsResponse.fromJson(Map<String, Object?> json) =>
      _$CertifecateParamsResponseFromJson(json);

  @JsonKey(name: 'GenerationTypes')
  final List<GenerationType> generationTypes;
  @JsonKey(name: 'StockUnits')
  final List<StockUnit> stockUnits;
  @JsonKey(name: 'ProductTypes')
  final List<ProductType> productTypes;
  @JsonKey(name: 'ItemClasses')
  final List<ItemClass> itemClasses;
  @JsonKey(name: 'Countries')
  final List<Country> countries;

  Map<String, Object?> toJson() => _$CertifecateParamsResponseToJson(this);
}
