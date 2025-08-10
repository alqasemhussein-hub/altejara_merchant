part of 'certificate_price_cubit.dart';

@freezed
abstract class CertificatePriceState with _$CertificatePriceState {
  const factory CertificatePriceState.initial({
    @Default(RemoteDataState.ideal) RemoteDataState remoteStatus,
    CertifecatePricesResponse? certificatePrices,
  }) = _Initial;
}
