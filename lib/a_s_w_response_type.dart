import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'a_s_w_response_type.freezed.dart';

@freezed
sealed class ASWResponseType with _$ASWResponseType {
  const ASWResponseType._();

  const factory ASWResponseType.json() = _Json;

  const factory ASWResponseType.stream() = _Stream;

  const factory ASWResponseType.plain() = _Plain;

  const factory ASWResponseType.bytes() = _Bytes;
}

extension ASWResponseTypeEx on ASWResponseType {
  ResponseType get toDio => switch (this) {
    _Json() => ResponseType.json,
    _Stream() => ResponseType.stream,
    _Plain() => ResponseType.plain,
    _Bytes() => ResponseType.bytes,
  };
}
