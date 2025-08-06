import '../../domain/repositories/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;
  VerifyOtpUseCase(this.repository);

  Future<bool> call(String code) {
    return repository.verifyOtp(code);
  }
}
