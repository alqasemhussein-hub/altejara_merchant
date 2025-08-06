import '../value_objects/otp_method.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<User?> login(String username, String password);
  Future<void> sendOtp(OtpMethod method);
  Future<bool> verifyOtp(String code);
}
