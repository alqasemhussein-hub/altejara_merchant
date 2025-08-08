// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) =>
    HomeDataResponse(
      certificateData: json['CertificateData'] == null
          ? null
          : CertificateData.fromJson(
              json['CertificateData'] as Map<String, dynamic>,
            ),
      booksCount: (json['BooksCount'] as num).toInt(),
      isTajerActive: json['IsTajerActive'] as bool,
    );

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'CertificateData': instance.certificateData,
      'BooksCount': instance.booksCount,
      'IsTajerActive': instance.isTajerActive,
    };
