import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/api/models/certificate/upload_file_response.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/main/certificate/datastource/certificate_datsource.dart';

part 'upload_file_cubit.freezed.dart';
part 'upload_file_state.dart';

class UploadFileCubit extends Cubit<UploadFileState> {
  UploadFileCubit() : super(UploadFileState.initial());
  CertificateDatsource certificateDatsource = CertificateDatsource();
  uploadFile(File file) async {
    emit(state.copyWith(remoteDataState: RemoteDataState.loading));

    certificateDatsource.uploadFile(file).then((certificates) {
      if (certificates is DataSuccess) {
        emit(
          state.copyWith(
            remoteDataState: RemoteDataState.loaded,
            uploadFileResponse: certificates.data,
          ),
        );
      } else {
        emit(state.copyWith(remoteDataState: RemoteDataState.error));
      }
    });
  }
}
