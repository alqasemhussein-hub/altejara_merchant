import 'package:techara_merchant/src/core/network/error_model.dart';

abstract class DataState<T> {
  final T? data;
  final ErrorResponseModel? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(ErrorResponseModel error) : super(error: error);
}

class DataNotSet<T> extends DataState<T> {
  const DataNotSet();
}
