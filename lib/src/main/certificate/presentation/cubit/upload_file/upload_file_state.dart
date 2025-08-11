part of 'upload_file_cubit.dart';

@freezed
abstract class UploadFileState with _$UploadFileState {
  const factory UploadFileState.initial({
    @Default(RemoteDataState.ideal) RemoteDataState remoteDataState,

    String? uploadFileResponse,
    String? otherFilePath,
  }) = _Initial;
}
