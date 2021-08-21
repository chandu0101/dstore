import 'package:dstore/dstore.dart';

part "local.api.dstore.dart";
part "local.g.dart";

const localAPi = GraphqlApi(
    apiUrl: "http://localhost:4000/graphql",
    wsUrl: "ws://localhost:4000/graphql",
    cacheOnlineApiSchema: "./local.graphql",
    revison: "0.13.223",
    collectionEquality: CollectionEquality.equals);

@localAPi
class LocalGraphqlApi {}
