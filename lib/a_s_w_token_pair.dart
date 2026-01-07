import 'package:freezed_annotation/freezed_annotation.dart';

part 'a_s_w_token_pair.freezed.dart';

@freezed
abstract class ASWTokenPair with _$ASWTokenPair {
  const ASWTokenPair._();

  const factory ASWTokenPair({
    required String accessToken,
    String? refreshToken,
    DateTime? expiresAt,
  }) = _ASWTokenPair;

  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }
}
