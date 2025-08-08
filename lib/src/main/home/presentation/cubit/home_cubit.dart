import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/api/models/home/home_data_response.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/main/home/datastource/home_datsource.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
  HomeDataSource apiClient = HomeDataSource();

  getHomeData() async {
    emit(state.copyWith(state: RemoteDataState.loading));

    apiClient.getHomeData().then((value) {
      if (value is DataSuccess) {
        emit(
          state.copyWith(
            state: RemoteDataState.subSuccess,
            homeData: value.data,
          ),
        );
      } else if (value is DataFailed) {
        emit(state.copyWith(state: RemoteDataState.error));
      }
    });
  }
}
