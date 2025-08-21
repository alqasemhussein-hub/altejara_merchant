import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/main/certificate/datastource/certificate_datsource.dart';

part 'upload_file_cubit.freezed.dart';
part 'upload_file_state.dart';

class UploadFileCubit extends Cubit<UploadFileState> {
  UploadFileCubit() : super(UploadFileState.initial());
  CertificateDatsource certificateDatsource = CertificateDatsource();
  uploadFile(File certificateFile, File registerFile) async {
    emit(state.copyWith(remoteDataState: RemoteDataState.loading));

    final certResponse = await certificateDatsource.uploadFile(certificateFile);

    final regResponse = await certificateDatsource.uploadFile(registerFile);

    if (certResponse is DataSuccess && regResponse is DataSuccess) {
      emit(
        state.copyWith(
          remoteDataState: RemoteDataState.loaded,
          uploadCertificateFileResponse: certResponse.data!.path,
          uploadClearanceDocsFileResponse: regResponse.data!.path,
        ),
      );
    } else {
      emit(state.copyWith(remoteDataState: RemoteDataState.error));
    }
  }

  Future<void> uploadRegistrationFiles(
    File profileImage,
    List<File> uploadedFiles,
  ) async {
    emit(state.copyWith(remoteDataState: RemoteDataState.loading));

    final profileResponse = await certificateDatsource.uploadFile(profileImage);
    final otherFileresponse = await certificateDatsource
        .uploadRegistrationFiles(uploadedFiles);

    if (profileResponse is DataSuccess && otherFileresponse is DataSuccess) {
      emit(
        state.copyWith(
          remoteDataState: RemoteDataState.loaded,
          uploadCertificateFileResponse: profileResponse.data!.path,
          uploadClearanceDocsFileResponse: profileResponse.data!.path,
          otherFilePath: otherFileresponse.data!,
        ),
      );
    } else {
      emit(state.copyWith(remoteDataState: RemoteDataState.error));
    }
  }

  //   void fetchCertificates() {
  //     emit(state.copyWith(remoteDataState: RemoteDataState.loading));

  //     certificateDatsource.fetchCertificates()

  //  .then((certificates) {
  //       if (certificates is DataSuccess) {
  //         emit(
  //           state.copyWith(
  //             remoteDataState: RemoteDataState.loaded,
  //             uploadFileResponse: certificates.data,
  //           ),
  //         );
  //       } else {
  //         emit(state.copyWith(remoteDataState: RemoteDataState.error));
  //       }
  //     });
  //   }
}
