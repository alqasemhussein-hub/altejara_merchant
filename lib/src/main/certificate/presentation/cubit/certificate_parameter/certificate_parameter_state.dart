part of 'certificate_parameter_cubit.dart';

@freezed
abstract class CertificateParameterState with _$CertificateParameterState {
  const factory CertificateParameterState.initial({
    @Default(RemoteDataState.ideal) RemoteDataState state,
    CertifecateParamsResponse? certificateParams,
  }) = _Initial;
}
