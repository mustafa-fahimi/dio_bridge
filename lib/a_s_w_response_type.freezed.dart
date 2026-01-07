// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'a_s_w_response_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ASWResponseType {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ASWResponseType);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ASWResponseType()';
}


}

/// @nodoc
class $ASWResponseTypeCopyWith<$Res>  {
$ASWResponseTypeCopyWith(ASWResponseType _, $Res Function(ASWResponseType) __);
}


/// Adds pattern-matching-related methods to [ASWResponseType].
extension ASWResponseTypePatterns on ASWResponseType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Json value)?  json,TResult Function( _Stream value)?  stream,TResult Function( _Plain value)?  plain,TResult Function( _Bytes value)?  bytes,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Json() when json != null:
return json(_that);case _Stream() when stream != null:
return stream(_that);case _Plain() when plain != null:
return plain(_that);case _Bytes() when bytes != null:
return bytes(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Json value)  json,required TResult Function( _Stream value)  stream,required TResult Function( _Plain value)  plain,required TResult Function( _Bytes value)  bytes,}){
final _that = this;
switch (_that) {
case _Json():
return json(_that);case _Stream():
return stream(_that);case _Plain():
return plain(_that);case _Bytes():
return bytes(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Json value)?  json,TResult? Function( _Stream value)?  stream,TResult? Function( _Plain value)?  plain,TResult? Function( _Bytes value)?  bytes,}){
final _that = this;
switch (_that) {
case _Json() when json != null:
return json(_that);case _Stream() when stream != null:
return stream(_that);case _Plain() when plain != null:
return plain(_that);case _Bytes() when bytes != null:
return bytes(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  json,TResult Function()?  stream,TResult Function()?  plain,TResult Function()?  bytes,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Json() when json != null:
return json();case _Stream() when stream != null:
return stream();case _Plain() when plain != null:
return plain();case _Bytes() when bytes != null:
return bytes();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  json,required TResult Function()  stream,required TResult Function()  plain,required TResult Function()  bytes,}) {final _that = this;
switch (_that) {
case _Json():
return json();case _Stream():
return stream();case _Plain():
return plain();case _Bytes():
return bytes();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  json,TResult? Function()?  stream,TResult? Function()?  plain,TResult? Function()?  bytes,}) {final _that = this;
switch (_that) {
case _Json() when json != null:
return json();case _Stream() when stream != null:
return stream();case _Plain() when plain != null:
return plain();case _Bytes() when bytes != null:
return bytes();case _:
  return null;

}
}

}

/// @nodoc


class _Json extends ASWResponseType {
  const _Json(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Json);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ASWResponseType.json()';
}


}




/// @nodoc


class _Stream extends ASWResponseType {
  const _Stream(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stream);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ASWResponseType.stream()';
}


}




/// @nodoc


class _Plain extends ASWResponseType {
  const _Plain(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Plain);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ASWResponseType.plain()';
}


}




/// @nodoc


class _Bytes extends ASWResponseType {
  const _Bytes(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bytes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ASWResponseType.bytes()';
}


}




// dart format on
