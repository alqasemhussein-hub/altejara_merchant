// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgetPasswordState {

 RemoteDataState get remoteDataState; String? get errorMessage; String? get response;
/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgetPasswordStateCopyWith<ForgetPasswordState> get copyWith => _$ForgetPasswordStateCopyWithImpl<ForgetPasswordState>(this as ForgetPasswordState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordState&&(identical(other.remoteDataState, remoteDataState) || other.remoteDataState == remoteDataState)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,remoteDataState,errorMessage,response);

@override
String toString() {
  return 'ForgetPasswordState(remoteDataState: $remoteDataState, errorMessage: $errorMessage, response: $response)';
}


}

/// @nodoc
abstract mixin class $ForgetPasswordStateCopyWith<$Res>  {
  factory $ForgetPasswordStateCopyWith(ForgetPasswordState value, $Res Function(ForgetPasswordState) _then) = _$ForgetPasswordStateCopyWithImpl;
@useResult
$Res call({
 RemoteDataState remoteDataState, String? errorMessage, String? response
});




}
/// @nodoc
class _$ForgetPasswordStateCopyWithImpl<$Res>
    implements $ForgetPasswordStateCopyWith<$Res> {
  _$ForgetPasswordStateCopyWithImpl(this._self, this._then);

  final ForgetPasswordState _self;
  final $Res Function(ForgetPasswordState) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? remoteDataState = null,Object? errorMessage = freezed,Object? response = freezed,}) {
  return _then(_self.copyWith(
remoteDataState: null == remoteDataState ? _self.remoteDataState : remoteDataState // ignore: cast_nullable_to_non_nullable
as RemoteDataState,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgetPasswordState].
extension ForgetPasswordStatePatterns on ForgetPasswordState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RemoteDataState remoteDataState,  String? errorMessage,  String? response)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.remoteDataState,_that.errorMessage,_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RemoteDataState remoteDataState,  String? errorMessage,  String? response)  initial,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.remoteDataState,_that.errorMessage,_that.response);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RemoteDataState remoteDataState,  String? errorMessage,  String? response)?  initial,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.remoteDataState,_that.errorMessage,_that.response);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ForgetPasswordState {
  const _Initial({this.remoteDataState = RemoteDataState.ideal, this.errorMessage, this.response});
  

@override@JsonKey() final  RemoteDataState remoteDataState;
@override final  String? errorMessage;
@override final  String? response;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.remoteDataState, remoteDataState) || other.remoteDataState == remoteDataState)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,remoteDataState,errorMessage,response);

@override
String toString() {
  return 'ForgetPasswordState.initial(remoteDataState: $remoteDataState, errorMessage: $errorMessage, response: $response)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 RemoteDataState remoteDataState, String? errorMessage, String? response
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remoteDataState = null,Object? errorMessage = freezed,Object? response = freezed,}) {
  return _then(_Initial(
remoteDataState: null == remoteDataState ? _self.remoteDataState : remoteDataState // ignore: cast_nullable_to_non_nullable
as RemoteDataState,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
