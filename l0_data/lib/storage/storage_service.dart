// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:l1_domain/storage/export.dart';

class StorageService implements IStorageService {
  static const _appStorageName = 'thrillie_storage';

  late FlutterSecureStorage _storageInstance;

  @override
  Future<void> init() async {
    _storageInstance = FlutterSecureStorage(
      aOptions: AndroidOptions.defaultOptions.copyWith(
        storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
        keyCipherAlgorithm:
            KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
        encryptedSharedPreferences: true,
        sharedPreferencesName: _appStorageName,
      ),
      iOptions: IOSOptions.defaultOptions,
      lOptions: LinuxOptions.defaultOptions,
      mOptions: MacOsOptions.defaultOptions,
      wOptions: WindowsOptions.defaultOptions,
      webOptions: WebOptions.defaultOptions,
    );
  }

  @override
  Future<void> write(
    String key,
    String value,
  ) async =>
      _storageInstance.write(
        key: key,
        value: value,
      );

  @override
  Future<String?> read(
    String key,
  ) async =>
      _storageInstance.read(
        key: key,
      );
}
