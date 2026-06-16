import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// Persists and retrieves auth credentials securely.
/// Registered as a lazy singleton so the same instance is shared app-wide.
@lazySingleton
class TokenStorage {
  TokenStorage(this._storage);

  final FlutterSecureStorage _storage;

  static const _keyToken = 'auth_token';
  static const _keyExpiresAt = 'auth_expires_at';
  static const _keyUserId = 'auth_user_id';

  // ── Write ─────────────────────────────────────────────────────────────────

  Future<void> saveToken(String token) =>
      _storage.write(key: _keyToken, value: token);

  Future<void> saveExpiresAt(DateTime expiresAt) =>
      _storage.write(key: _keyExpiresAt, value: expiresAt.toIso8601String());

  Future<void> saveUserId(int userId) =>
      _storage.write(key: _keyUserId, value: userId.toString());

  /// Convenience: saves all three at once after login / register.
  Future<void> saveAuthData({
    required String token,
    required DateTime expiresAt,
    required int userId,
  }) async {
    await Future.wait([
      saveToken(token),
      saveExpiresAt(expiresAt),
      saveUserId(userId),
    ]);
  }

  // ── Read ──────────────────────────────────────────────────────────────────

  Future<String?> readToken() => _storage.read(key: _keyToken);

  Future<DateTime?> readExpiresAt() async {
    final raw = await _storage.read(key: _keyExpiresAt);
    if (raw == null) return null;
    return DateTime.tryParse(raw);
  }

  Future<int?> readUserId() async {
    final raw = await _storage.read(key: _keyUserId);
    if (raw == null) return null;
    return int.tryParse(raw);
  }

  // ── Token validity ────────────────────────────────────────────────────────

  /// Returns true when a token exists AND has not expired yet.
  /// Uses a 1-minute buffer so we don't send a token that is about to expire.
  Future<bool> isTokenValid() async {
    final token = await readToken();
    if (token == null || token.isEmpty) return false;

    final expiresAt = await readExpiresAt();
    if (expiresAt == null) return false;

    final buffer = expiresAt.toUtc().subtract(const Duration(minutes: 1));
    return DateTime.now().toUtc().isBefore(buffer);
  }

  // ── Clear ─────────────────────────────────────────────────────────────────

  Future<void> clearAll() => _storage.deleteAll();
}
