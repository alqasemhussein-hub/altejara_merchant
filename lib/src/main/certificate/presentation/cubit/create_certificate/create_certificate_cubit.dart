import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/api/models/certificate/add_certifecate_request.dart';
import 'package:techara_merchant/api/models/certificate/add_certifecate_response.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/extenstion/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/main/certificate/datastource/certificate_datsource.dart';

part 'create_certificate_cubit.freezed.dart';
part 'create_certificate_state.dart';

class CreateCertificateCubit extends Cubit<CreateCertificateState> {
  CreateCertificateCubit() : super(CreateCertificateState.initial());
  CertificateDatsource _certificateDatsource = CertificateDatsource();
  TextEditingController selectedLanguage = TextEditingController();
  setLanguage(String? language) {
    selectedLanguage.text = language ?? '';
  }

  createFormSubmit(AddCertifecateRequest body) {
    emit(state.copyWith(state: RemoteDataState.loading));
    L.info(msg: body.toJson().toString());
    _certificateDatsource.submitCertificate(body).then((response) {
      if (response is DataSuccess) {
        emit(
          state.copyWith(
            state: RemoteDataState.loaded,
            certificates: response.data,
          ),
        );
      } else if (response is DataFailed) {
        emit(
          state.copyWith(
            state: RemoteDataState.error,
            errorMessage: (response.error?.reason == 'Certificate Expired'
                ? 'الشهادة منتهية الصلاحية'
                : 'حدث خطأ أثناء إنشاء الشهادة'),
          ),
        );
      }
    });
  }
}
