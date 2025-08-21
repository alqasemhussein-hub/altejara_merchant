import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/main/auth/datastource/auth_remote.dart';

part 'forget_password_cubit.freezed.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordState.initial());
  AuthRemoteDataSource _authRemoteDataSource = AuthRemoteDataSource();

  void resetPassword({required String newPassword}) {
    emit(state.copyWith(remoteDataState: RemoteDataState.loading));
    _authRemoteDataSource.resetPassword(newPassword: newPassword).then((value) {
      if (value is DataSuccess) {
        emit(state.copyWith(remoteDataState: RemoteDataState.loaded));
        return;
      }

      emit(
        state.copyWith(
          remoteDataState: RemoteDataState.error,
          errorMessage: value.error?.reason,
        ),
      );
    });
  }
}
