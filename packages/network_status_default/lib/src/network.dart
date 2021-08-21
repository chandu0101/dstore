import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:dstore/dstore.dart';

class NetworkStatusDefault extends NetworkStatusListener {
  Function(bool status)? _listener;
  Connectivity? _connectivity;

  StreamSubscription<ConnectivityResult>? _subscription;
  @override
  Function() listen(Function(bool status) cb) {
    _listener = cb;
    if (_connectivity == null) {
      _connectivity = Connectivity();
      _subscription = _connectivity!.onConnectivityChanged
          .listen(_handleNetworkStatusChange);
    }
    return () {
      _connectivity = null;
      _subscription?.cancel();
    };
  }

  void _handleNetworkStatusChange(ConnectivityResult event) {
    final status = event == ConnectivityResult.none ? false : true;
    _listener?.call(status);
  }
}
