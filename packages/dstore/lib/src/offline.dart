const OFFLINE_ACTIONS_STORAGE_KEY = "_DSTORE_NETWORK_FFLINE_KEY_";

class NetworkOptions {
  final NetworkStatusListener statusListener;

  NetworkOptions({required this.statusListener});
}

abstract class NetworkStatusListener {
  void Function() listen(void Function(bool status) cb);
}
