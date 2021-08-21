import 'package:dstore_annotation/dstore_annotation.dart';

class OpenApi {
  final String? file;
  final OpenApiHttpConfig? http;
  final CollectionEquality? collectionEquality;
  final String? revison; // temp variable to trigger schema gen
  const OpenApi({this.file, this.http, this.revison, this.collectionEquality});
}

class OpenApiHttpConfig {
  final String url;
  final Map<String, String>? headers;
  final String? saveOnlineSpecToFile;

  const OpenApiHttpConfig(
      {required this.url, this.headers, this.saveOnlineSpecToFile});
}
