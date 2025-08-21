import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/api/models/auth/confirm_order_form.dart';
import 'package:techara_merchant/api/models/forget_password_query.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/core/service/local_storage.dart';
import 'package:techara_merchant/src/main/auth/datastource/auth_remote.dart';

part 'otp_bloc.freezed.dart';
part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpState.initial());
  AuthRemoteDataSource apiClient = AuthRemoteDataSource();

  void setTimer() {
    emit(state.copyWith(remainingTime: 60));
  }

  void decreaseRemainingTime() {
    if (state.remainingTime > 0) {
      emit(state.copyWith(remainingTime: state.remainingTime - 1));
    }
  }

  void resentOtp({required String classNumber, required bool whatsapp}) {
    emit(state.copyWith(state: RemoteDataState.loading));
    apiClient
        .resendOtpForLogin(classNumber: classNumber, whatsapp: whatsapp)
        .then((response) {
          if (response is DataFailed) {
            emit(
              state.copyWith(
                state: RemoteDataState.error,

                errorMessage:
                    'حدث خطأ أثناء إعادة إرسال الرمز. يرجى المحاولة مرة أخرى.',
              ),
            );
          }
          if (response is DataSuccess) {
            emit(state.copyWith(state: RemoteDataState.subSuccess));
          }
        });
  }

  void verifyOtp({required String classNumber, required String otpCode}) {
    emit(state.copyWith(state: RemoteDataState.loading));
    apiClient.verifyLogin(classNumber: classNumber, code: otpCode).then((
      response,
    ) {
      if (response is DataFailed) {
        emit(
          state.copyWith(
            state: RemoteDataState.error,
            errorMessage:
                'الرمز غير صحيح. يرجى التحقق من الرمز وإعادة المحاولة.',
          ),
        );
      }
      if (response is DataSuccess) {
        LocalDatabase.saveUserEntity(response.data!);
        emit(state.copyWith(state: RemoteDataState.loaded));
      }
    });
  }

  void sendForgetPasswordOtp(ForgetPasswordQuery userOrderForm) {
    emit(state.copyWith(state: RemoteDataState.loading));
    apiClient.submitToForgetPassword(post: userOrderForm).then((response) {
      if (response is DataSuccess) {
        emit(
          state.copyWith(
            state: RemoteDataState.subSuccess,
            idetifyer: response.data!.$1,
          ),
        );
        emit(state.copyWith(state: RemoteDataState.ideal));
      } else {
        emit(
          state.copyWith(
            state: RemoteDataState.error,
            errorMessage:
                (response as DataFailed).error?.reason == 'User not found'
                ? 'المستخدم غير موجود'
                : response.error?.reason,
          ),
        );
      }
    });
  }

  void verifyForgetOtp({required String classNumber, required String otpCode}) {
    emit(state.copyWith(state: RemoteDataState.loading));
    apiClient
        .verifyForgetPassword(classNumber: classNumber, code: otpCode)
        .then((response) {
          if (response is DataFailed) {
            emit(
              state.copyWith(
                state: RemoteDataState.error,
                errorMessage: response.error?.reason == 'Code Expired'
                    ? 'انتهت صلاحية الرمز'
                    : response.error?.reason,
              ),
            );
          }
          if (response is DataSuccess) {
            LocalDatabase.saveToken(response.data!);
            emit(state.copyWith(state: RemoteDataState.loaded));
          }
        });
  }

  void confirmOtp({required String email, required String otpCode}) {
    emit(state.copyWith(state: RemoteDataState.loading));
    apiClient
        .confirmOtp(
          data: ConfirmOrderForm(email: email, code: otpCode),
        )
        .then((response) {
          if (response is DataFailed) {
            emit(
              state.copyWith(
                state: RemoteDataState.error,
                errorMessage:
                    'الرمز غير صحيح. يرجى التحقق من الرمز وإعادة المحاولة.',
              ),
            );
          }
          if (response is DataSuccess) {
            emit(state.copyWith(state: RemoteDataState.loaded));
          }
        });
  }

  void setLoading(RemoteDataState status) {
    emit(state.copyWith(state: status));
  }

  resentOtpForRegister({required String classNumber}) {
    emit(state.copyWith(state: RemoteDataState.loading));
    apiClient.sendOtpForRegisterApi(classNumber: classNumber).then((response) {
      if (response is DataFailed) {
        emit(
          state.copyWith(
            state: RemoteDataState.error,
            errorMessage: response.error?.reason,
          ),
        );
      }
      if (response is DataSuccess) {
        emit(state.copyWith(state: RemoteDataState.loaded));
      }
    });
  }
}
