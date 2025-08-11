// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:techara_merchant/api/models/certificate/upload_file_response.dart';

import '../models/dictionarybase.dart';

part 'file_client.g.dart';

@RestApi()
abstract class FileClient {
  factory FileClient(Dio dio, {String? baseUrl}) = _FileClient;

  @MultiPart()
  @POST('/api/File/upload')
  Future<String> postApiFileUpload({@Part(name: 'RemoteFile') File? file});

  @MultiPart()
  @POST('/api/File/upload-multi')
  Future<void> postApiFileUploadMulti({@Part(name: 'Files') List<File>? files});

  @POST('/api/File/pdf')
  @MultiPart()
  Future<String> postApiFilePdf({
    @Part(name: 'Files') required List<File> files,
  });

  @GET('/api/file/directory')
  Future<void> getApiFileDirectory();

  @POST('/api/file/base64')
  Future<void> postApiFileBase64({@Body() Dictionarybase? body});

  @GET('/api/File/view/{fileName}')
  Future<void> getApiFileViewFileName({
    @Path('fileName') required String fileName,
  });
}
