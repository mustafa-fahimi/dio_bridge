import 'package:dio_bridge/dio_bridge.dart';
import 'package:dio/dio.dart';

typedef OnPercentage = void Function(int currentBytes, int totalBytes);

class ASWOption {
  const ASWOption({
    this.query,
    this.onReceiveProgress,
    this.onSendProgress,
    this.header = const ASWHeader.basic(),
    this.responseType = const ASWResponseType.json(),
  });

  final ASWHeader header;
  final Map<String, dynamic>? query;
  final OnPercentage? onReceiveProgress;
  final OnPercentage? onSendProgress;
  final ASWResponseType responseType;
}

extension ASWOptionEx on ASWOption {
  Options get requestOptions =>
      Options(responseType: responseType.toDio, headers: header.toMap);
}
