import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/user.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<User?> call(String username, String password) {
    return repository.login(username, password);
  }
}
