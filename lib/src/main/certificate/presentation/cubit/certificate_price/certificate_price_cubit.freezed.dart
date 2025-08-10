// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate_price_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CertificatePriceState {

 RemoteDataState get remoteStatus; CertifecatePricesResponse? get certificatePrices;
/// Create a copy of CertificatePriceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificatePriceStateCopyWith<CertificatePriceState> get copyWith => _$CertificatePriceStateCopyWithImpl<CertificatePriceState>(this as CertificatePriceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificatePriceState&&(identical(other.remoteStatus, remoteStatus) || other.remoteStatus == remoteStatus)&&(identical(other.certificatePrices, certificatePrices) || other.certificatePrices == certificatePrices));
}


@override
int get hashCode => Object.hash(runtimeType,remoteStatus,certificatePrices);

@override
String toString() {
  return 'CertificatePriceState(remoteStatus: $remoteStatus, certificatePrices: $certificatePrices)';
}


}

/// @nodoc
abstract mixin class $CertificatePriceStateCopyWith<$Res>  {
  factory $CertificatePriceStateCopyWith(CertificatePriceState value, $Res Function(CertificatePriceState) _then) = _$CertificatePriceStateCopyWithImpl;
@useResult
$Res call({
 RemoteDataState remoteStatus, CertifecatePricesResponse? certificatePrices
});




}
/// @nodoc
class _$CertificatePriceStateCopyWithImpl<$Res>
    implements $CertificatePriceStateCopyWith<$Res> {
  _$CertificatePriceStateCopyWithImpl(this._self, this._then);

  final CertificatePriceState _self;
  final $Res Function(CertificatePriceState) _then;

/// Create a copy of CertificatePriceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? remoteStatus = null,Object? certificatePrices = freezed,}) {
  return _then(_self.copyWith(
remoteStatus: null == remoteStatus ? _self.remoteStatus : remoteStatus // ignore: cast_nullable_to_non_nullable
as RemoteDataState,certificatePrices: freezed == certificatePrices ? _self.certificatePrices : certificatePrices // ignore: cast_nullable_to_non_nullable
as CertifecatePricesResponse?,
  ));
}

}


/// Adds pattern-matching-related methods to [CertificatePriceState].
extension CertificatePriceStatePatterns on CertificatePriceState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RemoteDataState remoteStatus,  CertifecatePricesResponse? certificatePrices)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.remoteStatus,_that.certificatePrices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RemoteDataState remoteStatus,  CertifecatePricesResponse? certificatePrices)  initial,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.remoteStatus,_that.certificatePrices);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RemoteDataState remoteStatus,  CertifecatePricesResponse? certificatePrices)?  initial,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.remoteStatus,_that.certificatePrices);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CertificatePriceState {
  const _Initial({this.remoteStatus = RemoteDataState.ideal, this.certificatePrices});
  

@override@JsonKey() final  RemoteDataState remoteStatus;
@override final  CertifecatePricesResponse? certificatePrices;

/// Create a copy of CertificatePriceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.remoteStatus, remoteStatus) || other.remoteStatus == remoteStatus)&&(identical(other.certificatePrices, certificatePrices) || other.certificatePrices == certificatePrices));
}


@override
int get hashCode => Object.hash(runtimeType,remoteStatus,certificatePrices);

@override
String toString() {
  return 'CertificatePriceState.initial(remoteStatus: $remoteStatus, certificatePrices: $certificatePrices)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $CertificatePriceStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 RemoteDataState remoteStatus, CertifecatePricesResponse? certificatePrices
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of CertificatePriceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remoteStatus = null,Object? certificatePrices = freezed,}) {
  return _then(_Initial(
remoteStatus: null == remoteStatus ? _self.remoteStatus : remoteStatus // ignore: cast_nullable_to_non_nullable
as RemoteDataState,certificatePrices: freezed == certificatePrices ? _self.certificatePrices : certificatePrices // ignore: cast_nullable_to_non_nullable
as CertifecatePricesResponse?,
  ));
}


}

// dart format on
