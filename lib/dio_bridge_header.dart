import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'dio_bridge_header.freezed.dart';

@freezed
sealed class DioBridgeHeader with _$DioBridgeHeader {
  const DioBridgeHeader._();

  const factory DioBridgeHeader.formData({Map<String, String>? headers}) = _FormData;
  const factory DioBridgeHeader.basic({Map<String, String>? headers}) = _Basic;
  const factory DioBridgeHeader.data({Map<String, String>? headers}) = _Data;
}

extension DioBridgeHeaderEx on DioBridgeHeader {
  static String _generateBoundary() {
    final random = Random();
    final chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return String.fromCharCodes(
      List.generate(32, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }

  Map<String, String> get toMap {
    final headers = switch (this) {
      _FormData(headers: final h) => h,
      _Basic(headers: final h) => h,
      _Data(headers: final h) => h,
    };

    final map = <String, String>{
      'accept': 'application/json',
      'content-type': switch (this) {
        _FormData() => 'multipart/form-data; boundary=${_generateBoundary()}',
        _Basic() => 'application/json; charset=utf-8',
        _Data() => 'application/json; charset=utf-8',
      },
    };

    if (headers != null && headers.isNotEmpty) {
      map.addAll(headers);
    }

    return map;
  }
}
