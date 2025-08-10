import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/api/models/certificate/certifecate_list_response.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/main/certificate/datastource/certificate_datsource.dart';

part 'certificate_cubit.freezed.dart';
part 'certificate_state.dart';

class CertificateCubit extends Cubit<CertificateState> {
  CertificateCubit() : super(CertificateState.initial());
  CertificateDatsource certificateDatsource = CertificateDatsource();
  getCertificates() {
    emit(state.copyWith(state: RemoteDataState.loading));
    certificateDatsource.getCertificateDatsourceData().then((certificates) {
      if (certificates is DataSuccess) {
        emit(
          state.copyWith(
            state: RemoteDataState.loaded,
            certificates: certificates.data,
          ),
        );
      } else {
        emit(state.copyWith(state: RemoteDataState.error));
      }
    });
  }
}
