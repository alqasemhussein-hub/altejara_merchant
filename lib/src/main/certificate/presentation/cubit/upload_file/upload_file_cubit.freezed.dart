// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_file_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UploadFileState {

 RemoteDataState get remoteDataState; String? get uploadCertificateFileResponse; String? get uploadClearanceDocsFileResponse; String? get otherFilePath;
/// Create a copy of UploadFileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadFileStateCopyWith<UploadFileState> get copyWith => _$UploadFileStateCopyWithImpl<UploadFileState>(this as UploadFileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadFileState&&(identical(other.remoteDataState, remoteDataState) || other.remoteDataState == remoteDataState)&&(identical(other.uploadCertificateFileResponse, uploadCertificateFileResponse) || other.uploadCertificateFileResponse == uploadCertificateFileResponse)&&(identical(other.uploadClearanceDocsFileResponse, uploadClearanceDocsFileResponse) || other.uploadClearanceDocsFileResponse == uploadClearanceDocsFileResponse)&&(identical(other.otherFilePath, otherFilePath) || other.otherFilePath == otherFilePath));
}


@override
int get hashCode => Object.hash(runtimeType,remoteDataState,uploadCertificateFileResponse,uploadClearanceDocsFileResponse,otherFilePath);

@override
String toString() {
  return 'UploadFileState(remoteDataState: $remoteDataState, uploadCertificateFileResponse: $uploadCertificateFileResponse, uploadClearanceDocsFileResponse: $uploadClearanceDocsFileResponse, otherFilePath: $otherFilePath)';
}


}

/// @nodoc
abstract mixin class $UploadFileStateCopyWith<$Res>  {
  factory $UploadFileStateCopyWith(UploadFileState value, $Res Function(UploadFileState) _then) = _$UploadFileStateCopyWithImpl;
@useResult
$Res call({
 RemoteDataState remoteDataState, String? uploadCertificateFileResponse, String? uploadClearanceDocsFileResponse, String? otherFilePath
});




}
/// @nodoc
class _$UploadFileStateCopyWithImpl<$Res>
    implements $UploadFileStateCopyWith<$Res> {
  _$UploadFileStateCopyWithImpl(this._self, this._then);

  final UploadFileState _self;
  final $Res Function(UploadFileState) _then;

/// Create a copy of UploadFileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? remoteDataState = null,Object? uploadCertificateFileResponse = freezed,Object? uploadClearanceDocsFileResponse = freezed,Object? otherFilePath = freezed,}) {
  return _then(_self.copyWith(
remoteDataState: null == remoteDataState ? _self.remoteDataState : remoteDataState // ignore: cast_nullable_to_non_nullable
as RemoteDataState,uploadCertificateFileResponse: freezed == uploadCertificateFileResponse ? _self.uploadCertificateFileResponse : uploadCertificateFileResponse // ignore: cast_nullable_to_non_nullable
as String?,uploadClearanceDocsFileResponse: freezed == uploadClearanceDocsFileResponse ? _self.uploadClearanceDocsFileResponse : uploadClearanceDocsFileResponse // ignore: cast_nullable_to_non_nullable
as String?,otherFilePath: freezed == otherFilePath ? _self.otherFilePath : otherFilePath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadFileState].
extension UploadFileStatePatterns on UploadFileState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RemoteDataState remoteDataState,  String? uploadCertificateFileResponse,  String? uploadClearanceDocsFileResponse,  String? otherFilePath)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.remoteDataState,_that.uploadCertificateFileResponse,_that.uploadClearanceDocsFileResponse,_that.otherFilePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RemoteDataState remoteDataState,  String? uploadCertificateFileResponse,  String? uploadClearanceDocsFileResponse,  String? otherFilePath)  initial,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.remoteDataState,_that.uploadCertificateFileResponse,_that.uploadClearanceDocsFileResponse,_that.otherFilePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RemoteDataState remoteDataState,  String? uploadCertificateFileResponse,  String? uploadClearanceDocsFileResponse,  String? otherFilePath)?  initial,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.remoteDataState,_that.uploadCertificateFileResponse,_that.uploadClearanceDocsFileResponse,_that.otherFilePath);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements UploadFileState {
  const _Initial({this.remoteDataState = RemoteDataState.ideal, this.uploadCertificateFileResponse, this.uploadClearanceDocsFileResponse, this.otherFilePath});
  

@override@JsonKey() final  RemoteDataState remoteDataState;
@override final  String? uploadCertificateFileResponse;
@override final  String? uploadClearanceDocsFileResponse;
@override final  String? otherFilePath;

/// Create a copy of UploadFileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.remoteDataState, remoteDataState) || other.remoteDataState == remoteDataState)&&(identical(other.uploadCertificateFileResponse, uploadCertificateFileResponse) || other.uploadCertificateFileResponse == uploadCertificateFileResponse)&&(identical(other.uploadClearanceDocsFileResponse, uploadClearanceDocsFileResponse) || other.uploadClearanceDocsFileResponse == uploadClearanceDocsFileResponse)&&(identical(other.otherFilePath, otherFilePath) || other.otherFilePath == otherFilePath));
}


@override
int get hashCode => Object.hash(runtimeType,remoteDataState,uploadCertificateFileResponse,uploadClearanceDocsFileResponse,otherFilePath);

@override
String toString() {
  return 'UploadFileState.initial(remoteDataState: $remoteDataState, uploadCertificateFileResponse: $uploadCertificateFileResponse, uploadClearanceDocsFileResponse: $uploadClearanceDocsFileResponse, otherFilePath: $otherFilePath)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $UploadFileStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 RemoteDataState remoteDataState, String? uploadCertificateFileResponse, String? uploadClearanceDocsFileResponse, String? otherFilePath
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of UploadFileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remoteDataState = null,Object? uploadCertificateFileResponse = freezed,Object? uploadClearanceDocsFileResponse = freezed,Object? otherFilePath = freezed,}) {
  return _then(_Initial(
remoteDataState: null == remoteDataState ? _self.remoteDataState : remoteDataState // ignore: cast_nullable_to_non_nullable
as RemoteDataState,uploadCertificateFileResponse: freezed == uploadCertificateFileResponse ? _self.uploadCertificateFileResponse : uploadCertificateFileResponse // ignore: cast_nullable_to_non_nullable
as String?,uploadClearanceDocsFileResponse: freezed == uploadClearanceDocsFileResponse ? _self.uploadClearanceDocsFileResponse : uploadClearanceDocsFileResponse // ignore: cast_nullable_to_non_nullable
as String?,otherFilePath: freezed == otherFilePath ? _self.otherFilePath : otherFilePath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
