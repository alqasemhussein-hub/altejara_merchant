import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/api/models/user_order_form.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/main/auth/datastource/auth_remote.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());
  AuthRemoteDataSource _authRemoteDataSource = AuthRemoteDataSource();

  void checkClassNumber(String classNumber) {
    emit(state.copyWith(remoteDataState: RemoteDataState.loading));
    _authRemoteDataSource.checkClassNumber(classNumber: classNumber).then((
      response,
    ) {
      if (response is DataSuccess && response.data == true) {
        emit(state.copyWith(remoteDataState: RemoteDataState.subSuccess));
        emit(state.copyWith(remoteDataState: RemoteDataState.ideal));
      } else {
        emit(
          state.copyWith(
            remoteDataState: RemoteDataState.error,
            errorMessage: (response as DataFailed).error?.reason == 'Not Found'
                ? 'رقم الاضبارة غير موجود'
                : 'رقم الاضبارة مسجل',
          ),
        );
      }
    });
  }

  void validateData(String email, String phone) {
    emit(state.copyWith(remoteDataState: RemoteDataState.loading));
    _authRemoteDataSource
        .validationPhoneAndEmail(email: email, phone: phone)
        .then((response) {
          if (response is DataSuccess && response.data == true) {
            emit(state.copyWith(remoteDataState: RemoteDataState.subSuccess));
            emit(state.copyWith(remoteDataState: RemoteDataState.ideal));
          } else {
            emit(
              state.copyWith(
                remoteDataState: RemoteDataState.error,
                errorMessage:
                    response.error?.reason ==
                        'Email and Phone Number already exists'
                    ? 'رقم الهاتف و البريد الإلكتروني  مسجل'
                    : response.error?.reason == 'Email already exists'
                    ? '  البريد الإلكتروني  مسجل'
                    : response.error?.reason == 'Phone Number already exists'
                    ? 'رقم الهاتف  مسجل'
                    : 'حدث خطأ',
              ),
            );
          }
        });
  }

  Future<void> submitData(UserOrderForm userData) async {
    emit(state.copyWith(remoteDataState: RemoteDataState.loading));
    await Future.delayed(Duration(seconds: 2));
    log('Submitting user data: ${userData.toJson()}');
    _authRemoteDataSource.submitUserData(userData: userData).then((response) {
      if (response is DataSuccess ||
          (response is DataFailed &&
              response.error?.reason == 'Order already exists')) {
        emit(state.copyWith(remoteDataState: RemoteDataState.loaded));
      } else {
        emit(
          state.copyWith(
            remoteDataState: RemoteDataState.error,
            errorMessage: 'Invalid class number',
          ),
        );
      }
    });
  }
}
