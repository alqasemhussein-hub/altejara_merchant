import 'package:techara_merchant/src/api/models/login_form.dart';
import 'package:techara_merchant/src/core/network/dio_client.dart';
import 'package:techara_merchant/utils/injector.dart';

class AuthRemoteDataSource {
  login({
    required String classNumber,
    required String password,
    bool isWhatsApp = false,
  }) async {
    getIt<ApiClient>()
        .instance(null)
        .auth
        .postApiAuthLogin(
          whatsapp: isWhatsApp,
          body: LoginForm(azbaraNum: classNumber, password: password),
        );
  }
}
