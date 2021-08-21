import 'package:dstore_flutter/src/navigation/history/history.dart';
import 'package:dstore_flutter/src/navigation/navigation_provider.dart';
import 'package:flutter/material.dart';

class UrlBuilder extends StatefulWidget {
  final Widget Function(Uri uri) builder;

  const UrlBuilder({Key? key, required this.builder}) : super(key: key);
  @override
  _UrlBuilderState createState() => _UrlBuilderState();
}

class _UrlBuilderState extends State<UrlBuilder> {
  VoidCallback? urlUnSubscriber;
  late UriListener listener;
  late Uri uri;
  @override
  void initState() {
    super.initState();
    listener = (Uri hurl) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        setState(() {
          print("calling setstate in url builder $hurl");
          uri = hurl;
        });
      });
    };
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    urlUnSubscriber?.call();
    urlUnSubscriber = context.dnavigation.dotTouchmeHistory.listenUrl(listener);
    uri = Uri.parse(context.dnavigation.url);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(uri);
  }

  @override
  void dispose() {
    urlUnSubscriber?.call();
    super.dispose();
  }
}
