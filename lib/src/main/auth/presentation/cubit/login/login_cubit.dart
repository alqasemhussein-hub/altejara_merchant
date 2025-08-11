import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/main/auth/datastource/auth_remote.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());
  AuthRemoteDataSource apiClient = AuthRemoteDataSource();

  login({
    required String classNumber,
    required String password,
    required bool whatsapp,
  }) {
    emit(state.copyWith(state: RemoteDataState.loading));
    apiClient
        .login(
          classNumber: classNumber,
          password: password,
          isWhatsApp: whatsapp,
        )
        .then((value) {
          if (value is DataSuccess) {
            emit(
              state.copyWith(
                state: RemoteDataState.subSuccess,
                idetifyer: value.data?.error?.content,
              ),
            );
          } else if (value is DataFailed) {
            emit(
              state.copyWith(
                state: RemoteDataState.error,
                errorMessage: value.error?.reason == 'User not found'
                    ? 'المستخدم غير موجود'
                    : 'حدث خطأ أثناء تسجيل الدخول',
              ),
            );
          }
        });
  }
}
