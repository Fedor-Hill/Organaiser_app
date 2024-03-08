import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

class StorageService {
  final _storage = const FlutterSecureStorage();

  Future writeStorage(String key, String value) async {
    await _storage.write(key: key, value: value, aOptions: _getAndroidOptions());
    // return writeData;
  }

  Future<String?> readStorage(String key) async {
    return await _storage.read(key: key, aOptions: _getAndroidOptions());
  }

  Future<bool> containStorage(String key) async {
    return await _storage.containsKey(key: key, aOptions: _getAndroidOptions());
  }

  Future deleteStorage(String key) async {
    await _storage.delete(key: key, aOptions: _getAndroidOptions());
  }
}
