// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certifecate_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertifecateListResponse _$CertifecateListResponseFromJson(
  Map<String, dynamic> json,
) => CertifecateListResponse(
  currentPage: (json['CurrentPage'] as num).toInt(),
  pageSize: (json['PageSize'] as num).toInt(),
  totalCount: (json['TotalCount'] as num).toInt(),
  totalPages: (json['TotalPages'] as num).toInt(),
  data: (json['Data'] as List<dynamic>)
      .map((e) => CertifecateDataItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CertifecateListResponseToJson(
  CertifecateListResponse instance,
) => <String, dynamic>{
  'CurrentPage': instance.currentPage,
  'PageSize': instance.pageSize,
  'TotalCount': instance.totalCount,
  'TotalPages': instance.totalPages,
  'Data': instance.data,
};
