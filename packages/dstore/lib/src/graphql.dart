import 'package:collection/collection.dart';

class GraphqlRequestInput<V> {
  final String query;
  final V? variables;
  final Map<String, dynamic>? extensions;
  final bool useGetForPersitent;

  GraphqlRequestInput(
      {required this.query,
      this.variables,
      this.extensions,
      this.useGetForPersitent = false});

  static Map<String, dynamic> toJson<V>(GraphqlRequestInput<V> req) {
    return <String, dynamic>{
      "query": req.query,
      "variables":
          req.variables != null ? (req.variables as dynamic).toJson() : null,
      "extensions": req.extensions,
      "useGetForPersitent": req.useGetForPersitent
    };
  }

  static GraphqlRequestInput<V> fromJson<V>(Map<String, dynamic> json,
      {V? variables}) {
    final query = json["query"]! as String;
    final extensions = json["extensions"] as Map<String, dynamic>?;
    final useGetForPersitent = json["useGetForPersitent"] as bool?;
    return GraphqlRequestInput(
        query: query,
        variables: variables,
        extensions: extensions,
        useGetForPersitent: useGetForPersitent ?? false);
  }
}

class SourceLocation {
  final int line;
  final int column;

  SourceLocation({required this.line, required this.column});

  factory SourceLocation.fromJson(Map<String, dynamic> json) =>
      SourceLocation(line: json["line"] as int, column: json["column"] as int);
}

class GraphqlError {
  final String message;
  final List<SourceLocation>? locations;
  final dynamic? originalError;
  final Map<String, dynamic>? extensions;
  final List<int>? positions;
  final dynamic? source;
  final List<String>? path;

  GraphqlError(
      {required this.message,
      this.locations,
      this.originalError,
      this.extensions,
      this.positions,
      this.source,
      this.path});

  factory GraphqlError.fromJson(Map<String, dynamic> json) {
    return GraphqlError(
      message: json['message'] as String,
      locations: (json["locations"] as List<dynamic>?)
          ?.map(
              (dynamic e) => SourceLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      originalError: json["originalError"],
      extensions: json["extensions"] as Map<String, dynamic>?,
      source: json["source"],
      positions: (json["positions"] as List<dynamic>?)
          ?.map((dynamic e) => e as int)
          .toList(),
      path: (json["path"] as List<dynamic>?)
          ?.map((dynamic e) => e as String)
          .toList(),
    );
  }

  @override
  String toString() {
    return 'GraphqlError(message: $message, locations: $locations, originalError: $originalError, extensions: $extensions, positions: $positions, source: $source, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return other is GraphqlError &&
        other.message == message &&
        collectionEquals(other.locations, locations) &&
        other.originalError == originalError &&
        collectionEquals(other.extensions, extensions) &&
        collectionEquals(other.positions, positions) &&
        other.source == source &&
        collectionEquals(other.path, path);
  }

  @override
  int get hashCode {
    return message.hashCode ^
        locations.hashCode ^
        originalError.hashCode ^
        extensions.hashCode ^
        positions.hashCode ^
        source.hashCode ^
        path.hashCode;
  }
}
