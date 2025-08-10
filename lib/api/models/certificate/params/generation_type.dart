import 'package:json_annotation/json_annotation.dart';

part 'generation_type.g.dart';

@JsonSerializable()
class GenerationType {
  const GenerationType({required this.id, required this.dscrp});

  factory GenerationType.fromJson(Map<String, Object?> json) =>
      _$GenerationTypeFromJson(json);

  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'Dscrp')
  final String dscrp;

  Map<String, Object?> toJson() => _$GenerationTypeToJson(this);
}
