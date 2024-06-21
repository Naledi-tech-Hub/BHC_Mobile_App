import 'package:bhc_mobile_app/util/log_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class StorageKeys {
  static const String accessToken = "access";
  static const String refreshToken = "refresh";
  static const String showFreePopUp = "hasShown";
  static const String showTrialPopUp = "hasShownTrial";
}

abstract class SecureStorage {
  static FlutterSecureStorage get _secureStorage =>
      const FlutterSecureStorage();

  static Future<void> write({
    required String key,
    required String value,
  }) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (error, trace) {
      println('details: $error\nstack trace: $trace');
    }
  }

  static Future<String?> read({required String key}) async =>
      await _secureStorage.read(key: key);

  static Future<bool> containsKey({required String key}) async =>
      await _secureStorage.containsKey(key: key);

  static Future<void> clearStorage() async {
    await Future.wait([
      _secureStorage.delete(key: StorageKeys.accessToken),
      _secureStorage.delete(key: StorageKeys.refreshToken),
      _secureStorage.delete(key: StorageKeys.showFreePopUp),
      _secureStorage.delete(key: StorageKeys.showTrialPopUp),
    ]);
  }

  static Future<void> delete({required String key}) async =>
      _secureStorage.delete(key: key);
}
