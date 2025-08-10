import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  const Country({required this.id, required this.dscrpA, required this.dscrpE});

  factory Country.fromJson(Map<String, Object?> json) =>
      _$CountryFromJson(json);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'DscrpA')
  final String dscrpA;
  @JsonKey(name: 'DscrpE')
  final String dscrpE;

  Map<String, Object?> toJson() => _$CountryToJson(this);
}
