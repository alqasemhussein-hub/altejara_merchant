import 'package:json_annotation/json_annotation.dart';

part 'item_class.g.dart';

@JsonSerializable()
class ItemClass {
  const ItemClass({
    required this.id,
    required this.dscrpA,
    required this.dscrpE,
  });

  factory ItemClass.fromJson(Map<String, Object?> json) =>
      _$ItemClassFromJson(json);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'DscrpA')
  final String dscrpA;
  @JsonKey(name: 'DscrpE')
  final String dscrpE;

  Map<String, Object?> toJson() => _$ItemClassToJson(this);
}
