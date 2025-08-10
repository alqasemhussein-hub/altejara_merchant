import 'package:json_annotation/json_annotation.dart';

part 'stock_unit.g.dart';

@JsonSerializable()
class StockUnit {
  const StockUnit({required this.id, required this.dscrp});

  factory StockUnit.fromJson(Map<String, Object?> json) =>
      _$StockUnitFromJson(json);

  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'Dscrp')
  final String dscrp;

  Map<String, Object?> toJson() => _$StockUnitToJson(this);
}
