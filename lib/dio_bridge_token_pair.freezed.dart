// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dio_bridge_token_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DioBridgeTokenPair {

 String get accessToken; String? get refreshToken; DateTime? get expiresAt;
/// Create a copy of DioBridgeTokenPair
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DioBridgeTokenPairCopyWith<DioBridgeTokenPair> get copyWith => _$DioBridgeTokenPairCopyWithImpl<DioBridgeTokenPair>(this as DioBridgeTokenPair, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DioBridgeTokenPair&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,expiresAt);

@override
String toString() {
  return 'DioBridgeTokenPair(accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $DioBridgeTokenPairCopyWith<$Res>  {
  factory $DioBridgeTokenPairCopyWith(DioBridgeTokenPair value, $Res Function(DioBridgeTokenPair) _then) = _$DioBridgeTokenPairCopyWithImpl;
@useResult
$Res call({
 String accessToken, String? refreshToken, DateTime? expiresAt
});




}
/// @nodoc
class _$DioBridgeTokenPairCopyWithImpl<$Res>
    implements $DioBridgeTokenPairCopyWith<$Res> {
  _$DioBridgeTokenPairCopyWithImpl(this._self, this._then);

  final DioBridgeTokenPair _self;
  final $Res Function(DioBridgeTokenPair) _then;

/// Create a copy of DioBridgeTokenPair
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = freezed,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DioBridgeTokenPair].
extension DioBridgeTokenPairPatterns on DioBridgeTokenPair {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DioBridgeTokenPair value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DioBridgeTokenPair() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DioBridgeTokenPair value)  $default,){
final _that = this;
switch (_that) {
case _DioBridgeTokenPair():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DioBridgeTokenPair value)?  $default,){
final _that = this;
switch (_that) {
case _DioBridgeTokenPair() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String? refreshToken,  DateTime? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DioBridgeTokenPair() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String? refreshToken,  DateTime? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _DioBridgeTokenPair():
return $default(_that.accessToken,_that.refreshToken,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String? refreshToken,  DateTime? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _DioBridgeTokenPair() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc


class _DioBridgeTokenPair extends DioBridgeTokenPair {
  const _DioBridgeTokenPair({required this.accessToken, this.refreshToken, this.expiresAt}): super._();
  

@override final  String accessToken;
@override final  String? refreshToken;
@override final  DateTime? expiresAt;

/// Create a copy of DioBridgeTokenPair
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DioBridgeTokenPairCopyWith<_DioBridgeTokenPair> get copyWith => __$DioBridgeTokenPairCopyWithImpl<_DioBridgeTokenPair>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DioBridgeTokenPair&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,expiresAt);

@override
String toString() {
  return 'DioBridgeTokenPair(accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$DioBridgeTokenPairCopyWith<$Res> implements $DioBridgeTokenPairCopyWith<$Res> {
  factory _$DioBridgeTokenPairCopyWith(_DioBridgeTokenPair value, $Res Function(_DioBridgeTokenPair) _then) = __$DioBridgeTokenPairCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String? refreshToken, DateTime? expiresAt
});




}
/// @nodoc
class __$DioBridgeTokenPairCopyWithImpl<$Res>
    implements _$DioBridgeTokenPairCopyWith<$Res> {
  __$DioBridgeTokenPairCopyWithImpl(this._self, this._then);

  final _DioBridgeTokenPair _self;
  final $Res Function(_DioBridgeTokenPair) _then;

/// Create a copy of DioBridgeTokenPair
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = freezed,Object? expiresAt = freezed,}) {
  return _then(_DioBridgeTokenPair(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
