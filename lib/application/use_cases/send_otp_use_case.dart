import '../../domain/repositories/auth_repository.dart';
import '../../domain/value_objects/otp_method.dart';

class SendOtpUseCase {
  final AuthRepository repository;
  SendOtpUseCase(this.repository);

  Future<void> call(OtpMethod method) {
    return repository.sendOtp(method);
  }
}
