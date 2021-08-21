import 'package:dstore/dstore.dart';

class InMemoryStorage extends PersitantStorage {
  final Map<String, dynamic> initialValues;
  List<String> errorKeys;

  static const state_key_prefix = "state_key";
  static const offline_keys_prefix = "offline_key";

  InMemoryStorage(
      {this.initialValues = const <String, dynamic>{},
      this.errorKeys = const []}) {}
  final prefs = <String, dynamic>{};
  @override
  Future<void> clear() async {
    prefs.clear();
  }

  @override
  Future<void> clearOfflineActions() async {
    prefs.removeWhere(
        (key, dynamic value) => key.startsWith(offline_keys_prefix));
  }

  @override
  Future get(String key) async {
    return prefs["${state_key_prefix}$key"];
  }

  @override
  Future<Map<String, dynamic>?> getKeys(Iterable<String> keys) async {
    final map = Map<String, dynamic>.fromEntries(prefs.entries
        .where((element) =>
            element.key.startsWith(state_key_prefix) &&
            keys.contains(element.key.replaceFirst(state_key_prefix, "")))
        .map((e) => MapEntry<String, dynamic>(
            e.key.replaceFirst(state_key_prefix, ""), e.value)));
    print("Initial Map $map");
    return map;
  }

  @override
  Future<List<Map<String, dynamic>>> getOfflineActions() async {
    final list = prefs.entries
        .where((element) => element.key.startsWith(offline_keys_prefix))
        .map((e) => e.value as Map<String, dynamic>)
        .toList();
    return list;
  }

  @override
  Future<String?> getVersion() async {
    return prefs["appVersion"] as String?;
  }

  @override
  Future<void> init() async {
    prefs.addAll(initialValues.map<String, dynamic>((key, dynamic value) =>
        MapEntry<String, dynamic>("${state_key_prefix}${key}", value)));
    print("prefs $prefs");
  }

  @override
  Future<void> set({required String key, required dynamic value}) async {
    if (errorKeys.contains(key)) {
      throw GenericStorageError("notable to persist");
    }
    final sk = "${state_key_prefix}${key}";
    prefs[sk] = value;
  }

  @override
  Future<void> setAll(Map<String, dynamic> keyValues) async {}

  @override
  Future<void> setOfflineAction(String key, dynamic value) async {
    final ok = "$offline_keys_prefix$key";
    prefs[ok] = value;
  }

  @override
  Future<void> setversion(String appVersion) async {
    prefs["appVersion"] = appVersion;
  }
}
