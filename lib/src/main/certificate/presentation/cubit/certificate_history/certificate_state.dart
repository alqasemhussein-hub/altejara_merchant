part of 'certificate_cubit.dart';

@freezed
abstract class CertificateState with _$CertificateState {
  const factory CertificateState.initial({
    @Default(RemoteDataState.ideal) RemoteDataState state,
    CertifecateListResponse? certificates,
  }) = _Initial;
}
