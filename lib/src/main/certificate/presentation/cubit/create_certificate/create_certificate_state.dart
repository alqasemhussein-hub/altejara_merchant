part of 'create_certificate_cubit.dart';

@freezed
abstract class CreateCertificateState with _$CreateCertificateState {
  const factory CreateCertificateState.initial({
    @Default(RemoteDataState.ideal) RemoteDataState state,
    AddCertifecateResponse? certificates,
    String? errorMessage,
  }) = _Initial;
}
