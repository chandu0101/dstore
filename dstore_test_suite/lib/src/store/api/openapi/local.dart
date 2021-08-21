import 'package:dstore/dstore.dart';
part 'local.api.dstore.dart';
part 'local.g.dart';

@OpenApi(
  file: "../examples/generic_backend/spec.json",
  collectionEquality: CollectionEquality.equals,
  revison: "0.1.438",
)
class $_LocalApi {}
