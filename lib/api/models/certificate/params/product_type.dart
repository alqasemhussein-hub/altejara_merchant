import 'package:json_annotation/json_annotation.dart';

part 'product_type.g.dart';

@JsonSerializable()
class ProductType {
  const ProductType({required this.id, required this.dscrp});

  factory ProductType.fromJson(Map<String, Object?> json) =>
      _$ProductTypeFromJson(json);

  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'Dscrp')
  final String dscrp;

  Map<String, Object?> toJson() => _$ProductTypeToJson(this);
}
