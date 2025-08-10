// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate_parameter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CertificateParameterState {

 RemoteDataState get state; CertifecateParamsResponse? get certificateParams;
/// Create a copy of CertificateParameterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificateParameterStateCopyWith<CertificateParameterState> get copyWith => _$CertificateParameterStateCopyWithImpl<CertificateParameterState>(this as CertificateParameterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateParameterState&&(identical(other.state, state) || other.state == state)&&(identical(other.certificateParams, certificateParams) || other.certificateParams == certificateParams));
}


@override
int get hashCode => Object.hash(runtimeType,state,certificateParams);

@override
String toString() {
  return 'CertificateParameterState(state: $state, certificateParams: $certificateParams)';
}


}

/// @nodoc
abstract mixin class $CertificateParameterStateCopyWith<$Res>  {
  factory $CertificateParameterStateCopyWith(CertificateParameterState value, $Res Function(CertificateParameterState) _then) = _$CertificateParameterStateCopyWithImpl;
@useResult
$Res call({
 RemoteDataState state, CertifecateParamsResponse? certificateParams
});




}
/// @nodoc
class _$CertificateParameterStateCopyWithImpl<$Res>
    implements $CertificateParameterStateCopyWith<$Res> {
  _$CertificateParameterStateCopyWithImpl(this._self, this._then);

  final CertificateParameterState _self;
  final $Res Function(CertificateParameterState) _then;

/// Create a copy of CertificateParameterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? certificateParams = freezed,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RemoteDataState,certificateParams: freezed == certificateParams ? _self.certificateParams : certificateParams // ignore: cast_nullable_to_non_nullable
as CertifecateParamsResponse?,
  ));
}

}


/// Adds pattern-matching-related methods to [CertificateParameterState].
extension CertificateParameterStatePatterns on CertificateParameterState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RemoteDataState state,  CertifecateParamsResponse? certificateParams)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.state,_that.certificateParams);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RemoteDataState state,  CertifecateParamsResponse? certificateParams)  initial,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.state,_that.certificateParams);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RemoteDataState state,  CertifecateParamsResponse? certificateParams)?  initial,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.state,_that.certificateParams);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CertificateParameterState {
  const _Initial({this.state = RemoteDataState.ideal, this.certificateParams});
  

@override@JsonKey() final  RemoteDataState state;
@override final  CertifecateParamsResponse? certificateParams;

/// Create a copy of CertificateParameterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.state, state) || other.state == state)&&(identical(other.certificateParams, certificateParams) || other.certificateParams == certificateParams));
}


@override
int get hashCode => Object.hash(runtimeType,state,certificateParams);

@override
String toString() {
  return 'CertificateParameterState.initial(state: $state, certificateParams: $certificateParams)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $CertificateParameterStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 RemoteDataState state, CertifecateParamsResponse? certificateParams
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of CertificateParameterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? certificateParams = freezed,}) {
  return _then(_Initial(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RemoteDataState,certificateParams: freezed == certificateParams ? _self.certificateParams : certificateParams // ignore: cast_nullable_to_non_nullable
as CertifecateParamsResponse?,
  ));
}


}

// dart format on
