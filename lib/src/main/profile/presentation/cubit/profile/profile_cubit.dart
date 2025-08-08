import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/api/models/home/user_data_response.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/main/profile/datastource/profile_datsource.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());
  ProfileDataSource apiClient = ProfileDataSource();
  getHomeData() async {
    emit(state.copyWith(remoteState: RemoteDataState.loading));

    apiClient.getUserData().then((value) {
      if (value is DataSuccess) {
        emit(
          state.copyWith(
            remoteState: RemoteDataState.loaded,
            userData: value.data,
          ),
        );
      } else if (value is DataFailed) {
        emit(state.copyWith(remoteState: RemoteDataState.error));
      }
    });
  }
}
