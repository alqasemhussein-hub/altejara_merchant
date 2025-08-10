import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/api/models/certificate/params/certifecate_params_response.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/main/certificate/datastource/certificate_datsource.dart';

part 'certificate_parameter_cubit.freezed.dart';
part 'certificate_parameter_state.dart';

class CertificateParameterCubit extends Cubit<CertificateParameterState> {
  CertificateParameterCubit() : super(CertificateParameterState.initial());
  CertificateDatsource certificateDatsource = CertificateDatsource();
  getCertificateParameter(String lang) {
    emit(state.copyWith(state: RemoteDataState.loading));
    try {
      certificateDatsource.getCertificateParameter(lang).then((certificates) {
        if (certificates is DataSuccess) {
          emit(
            state.copyWith(
              state: RemoteDataState.loaded,
              certificateParams: certificates.data,
            ),
          );
        } else {
          emit(state.copyWith(state: RemoteDataState.error));
        }
      });
    } catch (e) {
      emit(state.copyWith(state: RemoteDataState.error));
    }
  }
}
