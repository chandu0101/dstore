import "package:dstore/dstore.dart";
import 'package:hive/hive.dart';

class StorageHive implements PersitantStorage {
  static const _stateBoxKey = "_DSTORE_STATE_BOX";

  static const _version_key = "_DSTORE_APP_VERSION_";

  static const _offlineBoxKey = "_DSTORE_OFFLINE_BOX";

  late Box<dynamic> _stateBox;
  late Box<Map<String, dynamic>> _offlineBox;

  StorageHive();

  @override
  Future<void> init() async {
    _stateBox = await Hive.openBox<dynamic>(_stateBoxKey);
    _offlineBox = await Hive.openBox<Map<String, dynamic>>(_offlineBoxKey);
  }

  @override
  Future<dynamic> get(String key) async {
    return _stateBox.get(key);
  }

  Iterable<String> allStateKeys() =>
      _stateBox.keys.map((dynamic e) => e as String);

  @override
  Future<Map<String, dynamic>?> getKeys(Iterable<String> keys) async {
    final keysToget = keys.toSet();
    final aKeys = allStateKeys().toList();
    if (aKeys.isEmpty) {
      return null;
    }
    await _removeNotUsedKeys(aKeys, keysToget);
    final result = <String, dynamic>{};
    for (final k in keysToget) {
      result[k] = await get(k);
    }
    return result;
  }

  Future<void> _removeNotUsedKeys(
      List<String> allKeys, Set<String> newKeys) async {
    final keysToget = newKeys;
    final unusedKeys = <dynamic>[];
    for (final k in allKeys) {
      if (!keysToget.contains(k) && k != _version_key) {
        unusedKeys.add(k);
      }
    }
    await _stateBox.deleteAll(unusedKeys);
  }

  @override
  Future<void> set({required String key, required dynamic value}) async {
    await _stateBox.put(key, value);
  }

  @override
  Future<void> clear() async {
    await _stateBox.clear();
  }

  @override
  Future<void> setAll(Map<String, dynamic> keyValues) async {
    await _stateBox.putAll(keyValues);
  }

  @override
  Future<List<Map<String, dynamic>>> getOfflineActions() async {
    return _offlineBox.toMap().values.map((e) => e).toList();
  }

  @override
  Future<String?> getVersion() async {
    return _stateBox.get(_version_key) as String?;
  }

  @override
  Future<void> setversion(String appVersion) async {
    await _stateBox.put(_version_key, appVersion);
  }

  @override
  Future<void> setOfflineAction(String key, dynamic value) async {
    await _offlineBox.put(key, value as Map<String, dynamic>);
  }

  @override
  Future<void> clearOfflineActions() async {
    await _offlineBox.clear();
  }
}
