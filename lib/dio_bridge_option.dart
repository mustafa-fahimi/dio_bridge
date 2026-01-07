import 'package:dio_bridge/dio_bridge.dart';
import 'package:dio/dio.dart';

typedef OnPercentage = void Function(int currentBytes, int totalBytes);

class DioBridgeOption {
  const DioBridgeOption({
    this.query,
    this.onReceiveProgress,
    this.onSendProgress,
    this.header = const DioBridgeHeader.basic(),
    this.responseType = const DioBridgeResponseType.json(),
  });

  final DioBridgeHeader header;
  final Map<String, dynamic>? query;
  final OnPercentage? onReceiveProgress;
  final OnPercentage? onSendProgress;
  final DioBridgeResponseType responseType;
}

extension DioBridgeOptionEx on DioBridgeOption {
  Options get requestOptions =>
      Options(responseType: responseType.toDio, headers: header.toMap);
}
