import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/api/models/certificate/price/certifecate_prices_response.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/main/certificate/datastource/certificate_datsource.dart';

part 'certificate_price_cubit.freezed.dart';
part 'certificate_price_state.dart';

class CertificatePriceCubit extends Cubit<CertificatePriceState> {
  CertificatePriceCubit() : super(CertificatePriceState.initial());
  CertificateDatsource certificateDatsource = CertificateDatsource();
  getCertificatePrice() {
    emit(state.copyWith(remoteStatus: RemoteDataState.loading));
    certificateDatsource.getCertificatePricesDaraSource().then((certificates) {
      if (certificates is DataSuccess) {
        emit(
          state.copyWith(
            remoteStatus: RemoteDataState.loaded,
            certificatePrices: certificates.data,
          ),
        );
      } else {
        emit(state.copyWith(remoteStatus: RemoteDataState.error));
      }
    });
  }
}
