import 'package:json_annotation/json_annotation.dart';

import 'certificate_data_item.dart';

part 'certifecate_list_response.g.dart';

@JsonSerializable()
class CertifecateListResponse {
  const CertifecateListResponse({
    required this.currentPage,
    required this.pageSize,
    required this.totalCount,
    required this.totalPages,
    required this.data,
  });

  factory CertifecateListResponse.fromJson(Map<String, Object?> json) =>
      _$CertifecateListResponseFromJson(json);

  @JsonKey(name: 'CurrentPage')
  final int currentPage;
  @JsonKey(name: 'PageSize')
  final int pageSize;
  @JsonKey(name: 'TotalCount')
  final int totalCount;
  @JsonKey(name: 'TotalPages')
  final int totalPages;
  @JsonKey(name: 'Data')
  final List<CertifecateDataItem> data;

  Map<String, Object?> toJson() => _$CertifecateListResponseToJson(this);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import
