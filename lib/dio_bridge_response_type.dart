import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dio_bridge_response_type.freezed.dart';

@freezed
sealed class DioBridgeResponseType with _$DioBridgeResponseType {
  const DioBridgeResponseType._();

  const factory DioBridgeResponseType.json() = _Json;

  const factory DioBridgeResponseType.stream() = _Stream;

  const factory DioBridgeResponseType.plain() = _Plain;

  const factory DioBridgeResponseType.bytes() = _Bytes;
}

extension DioBridgeResponseTypeEx on DioBridgeResponseType {
  ResponseType get toDio => switch (this) {
    _Json() => ResponseType.json,
    _Stream() => ResponseType.stream,
    _Plain() => ResponseType.plain,
    _Bytes() => ResponseType.bytes,
  };
}
