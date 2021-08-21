import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import "package:dstore_generator/src/utils/utils.dart";

class FireStoreOpsVisitor extends SimpleAstVisitor<void> {
  final ops = <String>[];
  final ClassElement element;

  FireStoreOpsVisitor({required this.element});

  @override
  void visitFieldDeclaration(FieldDeclaration node) {
    final f = node.fields.variables.first;
    final name = f.name.name;
    final value = f.initializer;
    if (value == null) {
      throw ArgumentError.value("You should initialize variable $name");
    }
    final valueStr = value.toString();

    print("Name2 $name value $value");
    if (valueStr.startsWith("FireStoreQuery.") ||
        valueStr.startsWith("FireStoreGroupQuery.")) {
      final queryVisitor = FireStoreQueryOpVisitor();
      print("Child Entities ${value.childEntities}");
      value.childEntities.forEach((element) {
        print(element.runtimeType);
      });
      print("Child Entities done");
      value.visitChildren(queryVisitor);
      final dynamicVariables = queryVisitor.dynamicVariables;
      if (dynamicVariables.isNotEmpty) {
        final args = dynamicVariables
            .map((e) => "${e.type.replaceQuotes} ${e.name.replaceQuotes}")
            .join(", ");
        ops.add("""static   ${name}($args) {
                 return  ${queryVisitor.results.join(".\n")};
               }
               """);
      } else {
        ops.add(
            "static  final ${name} = ${queryVisitor.results.join(".\n")} ;");
      }
    }
  }
}

class FireStoreQueryOpVisitor extends RecursiveAstVisitor<Object> {
  final results = <String>[];
  final dynamicVariables = <FireStoreDynamicVariable>[];
  final s = FireStoreDynamicVariable(name: "", type: "");

  String _getOrderByResult(
      {required String methodName, required NodeList<Expression> arguments}) {
    final args = <String>[];
    if (methodName.contains("_")) {
      args.add("'${methodName.split("_").last}'");
    }
    if (arguments.isNotEmpty) {
      arguments.forEach((a) {
        if (a is NamedExpression) {
          args.add("${a.name.label.name}: ${a.expression}");
        } else {
          args.add("${a}");
        }
      });
    }
    return "orderBy(${args.join(", ")})";
  }

  String _getWhereResult(
      {required String methodName, required NodeList<Expression> arguments}) {
    final args = <String>[];
    if (methodName.contains("_")) {
      args.add("'${methodName.split("_").last}'");
    }
    if (arguments.isNotEmpty) {
      arguments.forEach((a) {
        if (a is NamedExpression) {
          var v = a.expression.toSource();
          if (v.startsWith("FireStoreDynamicVariable(")) {
            final va = v.split(",");
            final name = va.first.split(":").last.trim();
            final type = va.last.split(":").last.trim().replaceFirst(")", "");
            dynamicVariables
                .add(FireStoreDynamicVariable(name: name, type: type));
            v = name.replaceQuotes;
          }
          args.add("${a.name.label.name}: ${v}");
        } else {
          args.add("${a}");
        }
      });
    }
    return "where(${args.join(", ")})";
  }

  @override
  Object? visitPropertyAccess(PropertyAccess node) {
    print("visitPropertyAccess Enter $node");
    super.visitPropertyAccess(node);
    print("visitPropertyAccess Enter $node");
  }

  @override
  Object? visitFunctionExpression(FunctionExpression node) {
    print(
      "visitFunctionExpression before $node",
    );
    super.visitFunctionExpression(node);
    print(
      "visitFunctionExpression after $node",
    );
  }

  @override
  Object? visitArgumentList(ArgumentList node) {
    print(
        "visit ArgumentList enter $node , ${node.parent} ${node.parent.runtimeType}");
    final parent = node.parent;
    final parentStr = parent.toString();
    if (parent is MethodInvocation) {
      final methodName = parent.methodName.name;
      print("methodName $methodName");
      final arguments = node.arguments;
      if (parentStr == "FireStoreQuery.${methodName}()" ||
          parentStr == "FireStoreGroupQuery.${methodName}()") {
        // root collection
        final nameA = methodName.split("_");
        final typeName = nameA.last.replaceAll("()", "");
        final cMethod = parentStr.startsWith("FireStoreQuery")
            ? "collection"
            : "collectionGroup";
        results.add("""
      FirebaseFirestore.instance.$cMethod('${nameA.first}')
      .${getWithConverter(typeName)}""");
      } else if (methodName.endsWith("subcol")) {
        // sub collection
        final ma = methodName.split("_");
        final typeName = ma.last.replaceAll("subcol", "");
        final cn = ma.first;
        results.add("collection('$cn').${getWithConverter(typeName)}");
      }
      if (methodName.startsWith("orderBy")) {
        results.add(
            _getOrderByResult(methodName: methodName, arguments: arguments));
      } else if (methodName.startsWith("where")) {
        results
            .add(_getWhereResult(methodName: methodName, arguments: arguments));
      } else if (arguments.length == 1) {
        // single arg methods
        print(arguments.first.runtimeType);
        results.add("$methodName(${arguments.first})");
      }
    }
    if (node.parent is MethodInvocation) {
      print((node.parent as MethodInvocation).methodName);
    }
    // super.visitArgumentList(node);
    print("visit ArgumentList done $node ");
  }
}

String getWithConverter(String typeName) {
  return """withConverter<$typeName>(fromFirestore: (snapshots,_) => ${typeName}.fromJson(snapshots.data()!),
       toFirestore: (${typeName.toLowerCase()},_) => ${typeName.toLowerCase()}.toJson()
      )""";
}
