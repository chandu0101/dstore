import 'package:build/build.dart';
import 'package:dstore_generator/src/firebase/firestore/ops/visitors.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:analyzer/dart/element/element.dart';

Future<String> generateFireStoreOps(
    {required ClassElement element, required BuildStep buildStep}) async {
  final name = element.name.substring(2);
  final ast = await AstUtils.getAstNodeFromElement(element, buildStep);
  final visitor = FireStoreOpsVisitor(element: element);
  ast.visitChildren(visitor);
  return """
   class $name {
     ${visitor.ops.join("\n")}
   }
  """;
}
