import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:dstore_flutter/src/navigation/history/history.dart';
import 'package:flutter/material.dart';

class HistoryImpl extends History {
  var _source = <String>[];
  UriListener? _globalListerner;
  UriListener get g_listener => _globalListerner!;
  List<UriListener> _urlListeners = [];

  @override
  VoidCallback listen(UriListener listener) {
    _globalListerner = (Uri uri) {
      listener(uri);
      informUrlListeners();
    };
    return () {};
  }

  @override
  void push(String url, {bool nested = false}) {
    if (historyMode == HistoryMode.tabs) {
      _source = _source.where((e) => e != url).toList();
    }
    _source.add(url);
    this.url = url;
    informUrlListeners();
  }

  @override
  void replace(String url, {bool nested = false}) {
    if (historyMode == HistoryMode.tabs) {
      _source = _source.where((e) => e != url).toList();
    }
    if (_source.isNotEmpty) {
      _source.removeLast();
    }
    _source.add(url);
    informUrlListeners();
  }

  @override
  void goBack({String? burl, bool reloadBack = false}) {
    if (burl != null) {
      print("going back to url $burl");
      if (reloadBack) {
        g_listener(Uri.parse(url));
      } else {
        informUrlListeners();
      }
    } else if (canGoBack) {
      _source.removeLast();
      final url = _source.last;
      this.url = url;
      g_listener(Uri.parse(url));
    }
  }

  @override
  void go(int number) {
    //TODO
    throw UnimplementedError();
  }

  @override
  void setInitialUrl(String url) {
    _source.add(url);
    this.url = url;
  }

  // @override
  // String get url => _source.isNotEmpty ? _source.last : "";

  @override
  bool blockSameUrl = false;

  @override
  VoidCallback listenUrl(UriListener uriListener) {
    _urlListeners.add(uriListener);
    return () {
      _urlListeners = _urlListeners.where((l) => l != uriListener).toList();
    };
  }

  @override
  bool get canGoBack {
    return _source.length > 1;
  }

  @override
  void informUrlListeners([String? pUrl]) {
    print("informing url slisterners pUrl $pUrl");
    _urlListeners.forEach((ul) {
      print("listerner $ul");
      ul(Uri.parse(pUrl ?? url));
    });
  }

  @override
  String? get backUrl => canGoBack ? _source[_source.length - 2] : null;

  @override
  // TODO: implement currentUrl
  String? get currentUrl => throw UnimplementedError();
}

class NestedNavHistoryImpl extends NestedNavHistory {
  @override
  final History history;
  var source = <String>[];

  NestedNavHistoryImpl({required this.history});
  @override
  void push(String url) {
    if (historyMode == HistoryMode.tabs) {
      source = source.where((e) => e != url).toList();
    }
    source.add(url);
    history.url = url;
    history.informUrlListeners(url);
  }

  @override
  void replace(String url) {
    if (historyMode == HistoryMode.tabs) {
      source = source.where((e) => e != url).toList();
    }
    if (source.isNotEmpty) {
      source.removeLast();
    }
    source.add(url);
    history.url = url;
    history.informUrlListeners(url);
  }

  @override
  void goBack() {
    if (canGoBack) {
      source.removeLast();
      String? url;
      if (source.isNotEmpty) {
        url = source.last;
        history.url = url;
      } else {
        history.url = rootUrl;
      }
      history.goBack(burl: history.url, reloadBack: true);
    } else {
      history.url = rootUrl;
      history.goBack(burl: history.url, reloadBack: true);
    }
  }

  String? get backUrl =>
      (canGoBack && source.length > 1) ? source[source.length - 2] : null;

  bool get canGoBack => source.isNotEmpty;

  @override
  String toString() {
    return 'NestedNavHistory(history: $history, Source : $source, originAction: $originAction, historyMode: $historyMode, parentStackTypeName: $parentStackTypeName, parentNavKey: $parentNavKey)';
  }
}
