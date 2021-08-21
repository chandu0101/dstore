import 'package:dstore/dstore.dart';
import "package:json_annotation/json_annotation.dart";
part "local.api.dstore.dart";
part "local.g.dart";

final s = "2";
const api = GraphqlApi(
    apiUrl: "http://localhost:4000/",
    cacheOnlineApiSchema: "./graphql/dgraph/todos");

@api
class MyApi {}
