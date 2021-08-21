extension MapExt<K, V> on Map<K, V> {
  V getOrElse(String key, V v) => this[key] ?? v;
}
