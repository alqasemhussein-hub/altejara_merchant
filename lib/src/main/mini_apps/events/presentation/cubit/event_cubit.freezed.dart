// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EventState {

 List<EventEntity>? get events; DataFailed? get error; RemoteDataState get remoteDataState;
/// Create a copy of EventState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventStateCopyWith<EventState> get copyWith => _$EventStateCopyWithImpl<EventState>(this as EventState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventState&&const DeepCollectionEquality().equals(other.events, events)&&(identical(other.error, error) || other.error == error)&&(identical(other.remoteDataState, remoteDataState) || other.remoteDataState == remoteDataState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(events),error,remoteDataState);

@override
String toString() {
  return 'EventState(events: $events, error: $error, remoteDataState: $remoteDataState)';
}


}

/// @nodoc
abstract mixin class $EventStateCopyWith<$Res>  {
  factory $EventStateCopyWith(EventState value, $Res Function(EventState) _then) = _$EventStateCopyWithImpl;
@useResult
$Res call({
 List<EventEntity>? events, DataFailed? error, RemoteDataState remoteDataState
});




}
/// @nodoc
class _$EventStateCopyWithImpl<$Res>
    implements $EventStateCopyWith<$Res> {
  _$EventStateCopyWithImpl(this._self, this._then);

  final EventState _self;
  final $Res Function(EventState) _then;

/// Create a copy of EventState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? events = freezed,Object? error = freezed,Object? remoteDataState = null,}) {
  return _then(_self.copyWith(
events: freezed == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<EventEntity>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as DataFailed?,remoteDataState: null == remoteDataState ? _self.remoteDataState : remoteDataState // ignore: cast_nullable_to_non_nullable
as RemoteDataState,
  ));
}

}


/// Adds pattern-matching-related methods to [EventState].
extension EventStatePatterns on EventState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<EventEntity>? events,  DataFailed? error,  RemoteDataState remoteDataState)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.events,_that.error,_that.remoteDataState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<EventEntity>? events,  DataFailed? error,  RemoteDataState remoteDataState)  initial,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.events,_that.error,_that.remoteDataState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<EventEntity>? events,  DataFailed? error,  RemoteDataState remoteDataState)?  initial,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.events,_that.error,_that.remoteDataState);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements EventState {
  const _Initial({final  List<EventEntity>? events, this.error, this.remoteDataState = RemoteDataState.ideal}): _events = events;
  

 final  List<EventEntity>? _events;
@override List<EventEntity>? get events {
  final value = _events;
  if (value == null) return null;
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DataFailed? error;
@override@JsonKey() final  RemoteDataState remoteDataState;

/// Create a copy of EventState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&const DeepCollectionEquality().equals(other._events, _events)&&(identical(other.error, error) || other.error == error)&&(identical(other.remoteDataState, remoteDataState) || other.remoteDataState == remoteDataState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_events),error,remoteDataState);

@override
String toString() {
  return 'EventState.initial(events: $events, error: $error, remoteDataState: $remoteDataState)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $EventStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<EventEntity>? events, DataFailed? error, RemoteDataState remoteDataState
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of EventState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? events = freezed,Object? error = freezed,Object? remoteDataState = null,}) {
  return _then(_Initial(
events: freezed == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<EventEntity>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as DataFailed?,remoteDataState: null == remoteDataState ? _self.remoteDataState : remoteDataState // ignore: cast_nullable_to_non_nullable
as RemoteDataState,
  ));
}


}

// dart format on
