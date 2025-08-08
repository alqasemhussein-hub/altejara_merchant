import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/api/models/edit_password_form.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/main/profile/datastource/reset_password_datsource.dart';

part 'reset_password_cubit.freezed.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordState.initial());
  ResetPasswordDataSource resetPasswordDataSource = ResetPasswordDataSource();

  resetPassword({
    required String newPassword,
    required String oldPassword,
  }) async {
    emit(state.copyWith(remoteDataState: RemoteDataState.loading));
    final result = await resetPasswordDataSource.chanagePassword(
      EditPasswordForm(password: oldPassword, newPassword: newPassword),
    );
    if (result is DataFailed) {
      emit(state.copyWith(remoteDataState: RemoteDataState.error));
      return;
    }

    if (result is DataSuccess) {
      emit(state.copyWith(remoteDataState: RemoteDataState.loaded));
      return;
    }
  }
}
