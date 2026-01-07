import 'package:api_service_wrapper/a_s_w_token_pair.dart';
import 'package:database_service_wrapper/database_service_wrapper.dart';

class ASWTokenManager {
  ASWTokenManager._();

  static ASWTokenManager? _instance;
  static ASWTokenManager get instance {
    _instance ??= ASWTokenManager._();
    return _instance!;
  }

  late final DBSWSecureStorageServiceImplementation _storage;

  Future<void> initialize() async {
    _storage = DBSWSecureStorageServiceImplementation();
    await _storage.initialize();
  }

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _expiresAtKey = 'token_expires_at';

  Future<ASWTokenPair?> get tokenPair async {
    final accessToken = await _storage.read(_accessTokenKey);
    if (accessToken == null) return null;

    final refreshToken = await _storage.read(_refreshTokenKey);
    final expiresAtStr = await _storage.read(_expiresAtKey);
    final expiresAt = expiresAtStr != null
        ? DateTime.fromMillisecondsSinceEpoch(int.parse(expiresAtStr))
        : null;

    return ASWTokenPair(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresAt: expiresAt,
    );
  }

  Future<void> setTokenPair(ASWTokenPair tokenPair) async {
    await _storage.write(_accessTokenKey, tokenPair.accessToken);

    if (tokenPair.refreshToken != null) {
      await _storage.write(_refreshTokenKey, tokenPair.refreshToken!);
    }

    if (tokenPair.expiresAt != null) {
      await _storage.write(_expiresAtKey, tokenPair.expiresAt!.millisecondsSinceEpoch
          .toString());
    }
  }

  Future<void> clearTokens() async {
    await Future.wait([
      _storage.delete(_accessTokenKey),
      _storage.delete(_refreshTokenKey),
      _storage.delete(_expiresAtKey),
    ]);
  }

  Future<bool> get isAuthenticated async {
    return await tokenPair != null;
  }

  Future<bool> get isTokenExpired async {
    final pair = await tokenPair;
    return pair == null || pair.isExpired;
  }

  Future<String?> get accessToken async {
    return (await tokenPair)?.accessToken;
  }

  Future<String?> get refreshToken async {
    return (await tokenPair)?.refreshToken;
  }
}
