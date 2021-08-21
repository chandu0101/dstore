import 'package:dstore_annotation/dstore_annotation.dart';

class GraphqlApi {
  final String apiUrl;
  final String? schemaPath;
  final String? cacheOnlineApiSchema;
  final String? wsUrl;
  final Map<String, String>? headers;
  final Map<String, String>? scalarMap;
  final PersitantQueryMode? enablePersitantQueries;
  final CollectionEquality? collectionEquality;
  final String? revison; // temp variable to trigger schema gen
  const GraphqlApi(
      {required this.apiUrl,
      this.cacheOnlineApiSchema,
      this.schemaPath,
      this.wsUrl,
      this.headers,
      this.revison,
      this.collectionEquality,
      this.enablePersitantQueries,
      this.scalarMap});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GraphqlApi && other.apiUrl == apiUrl;
  }

  @override
  int get hashCode {
    return apiUrl.hashCode;
  }
}

enum PersitantQueryMode { GET, POST }

class GraphqlOps {
  final GraphqlApi api;

  final String? revision;
  const GraphqlOps(this.api, {this.revision});
}

class GraphqlOpsJS {
  final GraphqlApi api;
  const GraphqlOpsJS(this.api);
}

enum GraphqlDatabase { dgraph }

typedef SchemaUploadFn = Future<String> Function(String schema);

// supported fields objects,inputs,interfaces,unions,enums
class GraphqlSchemaSource {
  final String path;
  final String? lambdaSourceFile;
  final GraphqlDatabase database;
  final SchemaUploadRequest? schemaUplodDetails;
  final LambdasUploadDetails? lambdaUploadDetails;
  final bool uploadSchema;
  final bool uploadLambda;
  final String? comments;
  final String? revision;
  const GraphqlSchemaSource(
      {required this.path,
      required this.database,
      this.schemaUplodDetails,
      this.comments,
      this.lambdaUploadDetails,
      this.uploadLambda = false,
      this.lambdaSourceFile,
      this.revision,
      this.uploadSchema = false});
}

class SchemaUploadRequest {
  final String url;
  final Map<String, String>? headers;

  const SchemaUploadRequest({required this.url, this.headers});
}

class LambdasUploadDetails {
  final String sourceEntryFile;
  final String saveJSFileToPath;
  final String uid; // project uid in case of dgraph
  final String url;
  final String dart2jsBinaryPath;
  final String dart2jsOptLevel; // default to -O4
  final Map<String, String> headers;

  LambdasUploadDetails(
      {required this.sourceEntryFile,
      required this.uid,
      required this.url,
      required this.saveJSFileToPath,
      required this.headers,
      this.dart2jsOptLevel = "-O4",
      required this.dart2jsBinaryPath});
}

class ID {}
