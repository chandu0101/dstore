import 'package:dstore/src/action.dart';
import 'package:dstore/src/store.dart';

abstract class PersitantStorage {
  Future<void> init();
  Future<void> set({required String key, required dynamic value});
  Future<void> setAll(Map<String, dynamic> keyValues);
  Future<dynamic> get(String key);
  Future<Map<String, dynamic>?> getKeys(Iterable<String> keys);
  Future<void> clear();
  Future<void> setOfflineAction(String key, dynamic value);
  Future<List<Map<String, dynamic>>> getOfflineActions();
  Future<String?> getVersion();
  Future<void> setversion(String appVersion);
  Future<void> clearOfflineActions();
}

enum StorageWriteMode { DISKFIRST, DISKLAST }

enum StorageWriteErrorAction { ignore, revert_state_changes }

class StorageOptions {
  final PersitantStorage storage;
  final StorageWriteMode writeMode;
  final Future<StorageWriteErrorAction> Function(
      StorageError error, Store store, Action action) onWriteError;
  final dynamic Function(dynamic error) onReadError;

  StorageOptions(
      {required this.storage,
      required this.onWriteError,
      required this.onReadError,
      this.writeMode = StorageWriteMode.DISKLAST});
}

abstract class StorageError {}

class GenericStorageError extends StorageError {
  final String message;

  GenericStorageError(this.message);
}
