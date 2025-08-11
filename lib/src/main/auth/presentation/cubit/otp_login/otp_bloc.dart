import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/api/models/auth/confirm_order_form.dart';
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
                errorMessage: 'resend',
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
            errorMessage: 'verifyOtp',
          ),
        );
      }
      if (response is DataSuccess) {
        LocalDatabase.saveUserEntity(response.data!);
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
                errorMessage: 'verifyOtp',
              ),
            );
          }
          if (response is DataSuccess) {
            emit(state.copyWith(state: RemoteDataState.loaded));
          }
        });
  }
}
