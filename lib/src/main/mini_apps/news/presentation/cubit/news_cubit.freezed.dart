// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewsState {

 List<NewsEntity>? get news; List<NewsEntity>? get breakingNews; DataFailed? get error; RemoteDataState get remoteDataState;
/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsStateCopyWith<NewsState> get copyWith => _$NewsStateCopyWithImpl<NewsState>(this as NewsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsState&&const DeepCollectionEquality().equals(other.news, news)&&const DeepCollectionEquality().equals(other.breakingNews, breakingNews)&&(identical(other.error, error) || other.error == error)&&(identical(other.remoteDataState, remoteDataState) || other.remoteDataState == remoteDataState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(news),const DeepCollectionEquality().hash(breakingNews),error,remoteDataState);

@override
String toString() {
  return 'NewsState(news: $news, breakingNews: $breakingNews, error: $error, remoteDataState: $remoteDataState)';
}


}

/// @nodoc
abstract mixin class $NewsStateCopyWith<$Res>  {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) _then) = _$NewsStateCopyWithImpl;
@useResult
$Res call({
 List<NewsEntity>? news, List<NewsEntity>? breakingNews, DataFailed? error, RemoteDataState remoteDataState
});




}
/// @nodoc
class _$NewsStateCopyWithImpl<$Res>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._self, this._then);

  final NewsState _self;
  final $Res Function(NewsState) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? news = freezed,Object? breakingNews = freezed,Object? error = freezed,Object? remoteDataState = null,}) {
  return _then(_self.copyWith(
news: freezed == news ? _self.news : news // ignore: cast_nullable_to_non_nullable
as List<NewsEntity>?,breakingNews: freezed == breakingNews ? _self.breakingNews : breakingNews // ignore: cast_nullable_to_non_nullable
as List<NewsEntity>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as DataFailed?,remoteDataState: null == remoteDataState ? _self.remoteDataState : remoteDataState // ignore: cast_nullable_to_non_nullable
as RemoteDataState,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsState].
extension NewsStatePatterns on NewsState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<NewsEntity>? news,  List<NewsEntity>? breakingNews,  DataFailed? error,  RemoteDataState remoteDataState)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.news,_that.breakingNews,_that.error,_that.remoteDataState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<NewsEntity>? news,  List<NewsEntity>? breakingNews,  DataFailed? error,  RemoteDataState remoteDataState)  initial,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.news,_that.breakingNews,_that.error,_that.remoteDataState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<NewsEntity>? news,  List<NewsEntity>? breakingNews,  DataFailed? error,  RemoteDataState remoteDataState)?  initial,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.news,_that.breakingNews,_that.error,_that.remoteDataState);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements NewsState {
  const _Initial({final  List<NewsEntity>? news, final  List<NewsEntity>? breakingNews, this.error, this.remoteDataState = RemoteDataState.ideal}): _news = news,_breakingNews = breakingNews;
  

 final  List<NewsEntity>? _news;
@override List<NewsEntity>? get news {
  final value = _news;
  if (value == null) return null;
  if (_news is EqualUnmodifiableListView) return _news;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<NewsEntity>? _breakingNews;
@override List<NewsEntity>? get breakingNews {
  final value = _breakingNews;
  if (value == null) return null;
  if (_breakingNews is EqualUnmodifiableListView) return _breakingNews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DataFailed? error;
@override@JsonKey() final  RemoteDataState remoteDataState;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&const DeepCollectionEquality().equals(other._news, _news)&&const DeepCollectionEquality().equals(other._breakingNews, _breakingNews)&&(identical(other.error, error) || other.error == error)&&(identical(other.remoteDataState, remoteDataState) || other.remoteDataState == remoteDataState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_news),const DeepCollectionEquality().hash(_breakingNews),error,remoteDataState);

@override
String toString() {
  return 'NewsState.initial(news: $news, breakingNews: $breakingNews, error: $error, remoteDataState: $remoteDataState)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<NewsEntity>? news, List<NewsEntity>? breakingNews, DataFailed? error, RemoteDataState remoteDataState
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? news = freezed,Object? breakingNews = freezed,Object? error = freezed,Object? remoteDataState = null,}) {
  return _then(_Initial(
news: freezed == news ? _self._news : news // ignore: cast_nullable_to_non_nullable
as List<NewsEntity>?,breakingNews: freezed == breakingNews ? _self._breakingNews : breakingNews // ignore: cast_nullable_to_non_nullable
as List<NewsEntity>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as DataFailed?,remoteDataState: null == remoteDataState ? _self.remoteDataState : remoteDataState // ignore: cast_nullable_to_non_nullable
as RemoteDataState,
  ));
}


}

// dart format on
