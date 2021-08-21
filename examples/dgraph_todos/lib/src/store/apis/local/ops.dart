import 'package:dstore/dstore.dart';
import "./local.dart";
import "package:json_annotation/json_annotation.dart";
part "ops.api.dstore.dart";
part "ops.g.dart";

@GraphqlOps(api)
abstract class Hello {
  static const todo = """
    query todo{
      todo {
        text
      } 
    }
  
  """;

  static const ut = """
    query hu{
      hellou {
        __typename
        ... on Hello1 {
          one
        }
      }
    }
  """;
}
