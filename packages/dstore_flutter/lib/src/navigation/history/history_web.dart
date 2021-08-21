import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:dstore_flutter/src/navigation/history/history.dart';
import "dart:html";

class HistoryImpl extends History {
  dynamic Function(Event)? _listener;
  List<UriListener> _urlListeners = [];
  final _source = <String>[];
  bool _skipGlobalListener = false;
  //  window.performance.navigation.type =  window.performance.navigation.TYPE_BACK_FORWARD (2)
  @override
  VoidCallback listen(UriListener listener) {
    _listener = (Event event) {
      final url = window.location.href;
      if (isBrowserBackPreventModal) {
        isBrowserBackPreventModal = false;
        return;
      }
      if (beforeLeave != null) {
        print("Popup from browser back history");
        isBrowserBackPreventModal = true;
      }
      print("Url Changed in web ${url} skipGlobal  ${_skipGlobalListener}");
      if (!_skipGlobalListener) {
        urlChangedInSystem = true;
        listener(Uri.parse(url));
      } else {
        print("setting back to false");
        _skipGlobalListener = false;
      }
      informUrlListeners();
    };
    window.addEventListener("popstate", _listener);
    return () {
      window.removeEventListener("popstate", _listener);
    };
  }

  @override
  void push(String url, {bool nested = false}) {
    print("Pushing url web $url");
    if (!nested) {
      _source.add(url);
    }
    // _skipGlobalListener = true;
    print("pushing to web history");
    window.history.pushState(null, "", url);
    informUrlListeners();
  }

  @override
  void replace(String url, {bool nested = false}) {
    if (!nested) {
      if (_source.isNotEmpty) {
        _source.removeLast();
        _source.add(url);
      }
    }
    // _skipGlobalListener = true;
    window.history.replaceState(null, "", url);
    informUrlListeners();
  }

  @override
  void goBack({String? burl, bool reloadBack = false}) {
    if (burl == null) {
      if (canGoBack) {
        _source.removeLast();
      }
    } else {
      _skipGlobalListener = true;
    }
    print("Calling history goback burl $burl $_skipGlobalListener");
    window.history.back();
  }

  @override
  void go(int number) {
    window.history.go(number);
  }

  @override
  void setInitialUrl(String url) {}

  @override
  String get url => window.location.href;

  @override
  bool blockSameUrl = false;

  @override
  VoidCallback listenUrl(UriListener urlListener) {
    _urlListeners.add(urlListener);
    return () {
      _urlListeners = _urlListeners.where((l) => l != urlListener).toList();
    };
  }

  @override
  bool get canGoBack {
    return window.history.length > 1;
  }

  @override
  String? get backUrl => throw UnimplementedError();

  @override
  void informUrlListeners([String? pUrl]) {
    _urlListeners.forEach((ul) {
      ul(Uri.parse(pUrl ?? url));
    });
  }

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
    history.push(url, nested: true);
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
    history.replace(url, nested: true);
  }

  @override
  void goBack() {
    print("Calling nestednav callback");
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

  @override
  bool get canGoBack => source.isNotEmpty;

  @override
  String toString() {
    return 'NestedNavHistory(history: $history, Source : $source, originAction: $originAction, historyMode: $historyMode, parentStackTypeName: $parentStackTypeName, parentNavKey: $parentNavKey)';
  }
}
