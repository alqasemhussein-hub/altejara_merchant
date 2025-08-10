import 'package:json_annotation/json_annotation.dart';

part 'upload_file_response.g.dart';

@JsonSerializable()
class UploadFileResponse {
  const UploadFileResponse({required this.path});

  factory UploadFileResponse.fromJson(Map<String, Object?> json) =>
      _$UploadFileResponseFromJson(json);

  @JsonKey(name: 'path')
  final String path;

  Map<String, Object?> toJson() => _$UploadFileResponseToJson(this);
}
