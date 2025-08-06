import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/value_objects/otp_method.dart';

class FakeAuthRepository implements AuthRepository {
  String? _otpCode;

  @override
  Future<User?> login(String username, String password) async {
    if (username.isNotEmpty && password.isNotEmpty) {
      return User(username);
    }
    return null;
  }

  @override
  Future<void> sendOtp(OtpMethod method) async {
    _otpCode = '123456';
  }

  @override
  Future<bool> verifyOtp(String code) async {
    return _otpCode == code;
  }
}
