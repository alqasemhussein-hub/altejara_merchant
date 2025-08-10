// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_certificate_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateCertificateState {

 RemoteDataState get state; AddCertifecateResponse? get certificates;
/// Create a copy of CreateCertificateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCertificateStateCopyWith<CreateCertificateState> get copyWith => _$CreateCertificateStateCopyWithImpl<CreateCertificateState>(this as CreateCertificateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCertificateState&&(identical(other.state, state) || other.state == state)&&(identical(other.certificates, certificates) || other.certificates == certificates));
}


@override
int get hashCode => Object.hash(runtimeType,state,certificates);

@override
String toString() {
  return 'CreateCertificateState(state: $state, certificates: $certificates)';
}


}

/// @nodoc
abstract mixin class $CreateCertificateStateCopyWith<$Res>  {
  factory $CreateCertificateStateCopyWith(CreateCertificateState value, $Res Function(CreateCertificateState) _then) = _$CreateCertificateStateCopyWithImpl;
@useResult
$Res call({
 RemoteDataState state, AddCertifecateResponse? certificates
});




}
/// @nodoc
class _$CreateCertificateStateCopyWithImpl<$Res>
    implements $CreateCertificateStateCopyWith<$Res> {
  _$CreateCertificateStateCopyWithImpl(this._self, this._then);

  final CreateCertificateState _self;
  final $Res Function(CreateCertificateState) _then;

/// Create a copy of CreateCertificateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? certificates = freezed,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RemoteDataState,certificates: freezed == certificates ? _self.certificates : certificates // ignore: cast_nullable_to_non_nullable
as AddCertifecateResponse?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateCertificateState].
extension CreateCertificateStatePatterns on CreateCertificateState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RemoteDataState state,  AddCertifecateResponse? certificates)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.state,_that.certificates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RemoteDataState state,  AddCertifecateResponse? certificates)  initial,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.state,_that.certificates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RemoteDataState state,  AddCertifecateResponse? certificates)?  initial,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.state,_that.certificates);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CreateCertificateState {
  const _Initial({this.state = RemoteDataState.ideal, this.certificates});
  

@override@JsonKey() final  RemoteDataState state;
@override final  AddCertifecateResponse? certificates;

/// Create a copy of CreateCertificateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.state, state) || other.state == state)&&(identical(other.certificates, certificates) || other.certificates == certificates));
}


@override
int get hashCode => Object.hash(runtimeType,state,certificates);

@override
String toString() {
  return 'CreateCertificateState.initial(state: $state, certificates: $certificates)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $CreateCertificateStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 RemoteDataState state, AddCertifecateResponse? certificates
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of CreateCertificateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? certificates = freezed,}) {
  return _then(_Initial(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RemoteDataState,certificates: freezed == certificates ? _self.certificates : certificates // ignore: cast_nullable_to_non_nullable
as AddCertifecateResponse?,
  ));
}


}

// dart format on
