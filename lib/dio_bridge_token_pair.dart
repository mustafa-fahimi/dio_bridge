import 'package:freezed_annotation/freezed_annotation.dart';

part 'dio_bridge_token_pair.freezed.dart';

@freezed
abstract class DioBridgeTokenPair with _$DioBridgeTokenPair {
  const DioBridgeTokenPair._();

  const factory DioBridgeTokenPair({
    required String accessToken,
    String? refreshToken,
    DateTime? expiresAt,
  }) = _DioBridgeTokenPair;

  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }
}
