import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'style_state.dart';
part 'style_cubit.freezed.dart';

class StyleCubit extends Cubit<StyleState> {
  StyleCubit() : super(StyleState.initial());
}
