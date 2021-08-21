import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/graphql/globals.dart';
import 'package:dstore_generator/src/graphql/graphql_ast_utils.dart';
import 'package:dstore_generator/src/graphql/ops/gql_visitors.dart';
import 'package:dstore_generator/src/graphql/ops/graphql_ops_generator.dart';
import 'package:dstore_generator/src/graphql/ops_js/graphs_opsjs_generator.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:tuple/tuple.dart';
import "package:gql/language.dart" as lang;

class DSLFieldsVisitor extends SimpleAstVisitor<Object> {
  final ops = <String>[];
  final String className;
  final GraphqlApi api;
  final ClassElement element;
  final bool isJS;

  DSLFieldsVisitor(
      {required this.className,
      required this.element,
      required this.api,
      this.isJS = false});
  @override
  dynamic visitFieldDeclaration(FieldDeclaration node) {
    final field = node.fields.variables.first;
    final name = field.name.name;
    if (field.initializer == null) {
      throw ArgumentError.value(
          "You should provide inititalizer for  field $name");
    }
    final opSource = field.initializer!.toSource();
    if (opSource.startsWith("Query(") ||
        opSource.startsWith("Mutation(") ||
        opSource.startsWith("Subscription(")) {
      if (!opSource.substring(opSource.indexOf(")") + 1).startsWith("..")) {
        throw ArgumentError.value(
            "All graphql ops should use method method cascade to access properties , exmaple : Query()..field, Mutation()..field");
      }
      final tn = "${className}_${name}";

      final visitor = DSLVisitor(opName: tn, apiUrl: api.apiUrl);
      field.initializer!.visitChildren(visitor);
      final query = "${visitor.query}\n }";
      final doc = lang.parseString(query);
      final schema = graphqlSchemaMap[api.apiUrl]!;
      final op = isJS
          ? getJSOp(
              schema: schema, query: query, doc: doc, api: api, name: name)
          : generateOpsTypeForQuery(
              schema: schema,
              query: query,
              doc: doc,
              name: tn,
              api: api,
            );
      ops.add(op);
      // logger.shout("Query is $op");
    } else if (field.isConst) {
      final fe = element.fields.singleWhere((element) => element.name == name);
      final v = fe.computeConstantValue()!;
      if (v.type.toString() == "String") {
        final query = v.toStringValue()!;
        final doc = lang.parseString(query);
        final schema = graphqlSchemaMap[api.apiUrl]!;
        final dupOpsVisitor = DuplicateOperationVisitor(doc, schema);
        doc.accept(dupOpsVisitor);
        if (dupOpsVisitor.opType != null) {
          if (dupOpsVisitor.isMultipleOpsExist) {
            throw Exception(
                " You should specify only single query or mutation or subscription , not combined ops");
          }
          final tn = "${element.name}_${name}";

          final op = isJS
              ? getJSOp(
                  schema: schema, query: query, doc: doc, api: api, name: name)
              : generateOpsTypeForQuery(
                  schema: schema, query: query, doc: doc, name: tn, api: api);
          ops.add(op);
        }
      }
    }
  }
}

class DSLVisitor extends RecursiveAstVisitor<Object> {
  var query = "";
  final String opName;
  final String apiUrl;
  final _propsForType = <String>[];

  DSLVisitor({required this.opName, required this.apiUrl});

  @override
  Object? visitPropertyAccess(PropertyAccess node) {
    print("Peroperty access $node");
    var name = node.propertyName.name.removeDName;
    _propsForType.add(name);
    query += "$name\n";
    return super.visitPropertyAccess(node);
  }

  @override
  Object? visitMethodInvocation(MethodInvocation node) {
    print("Method invocation enter $node ${node.methodName}");
    var methodName = node.methodName.name.removeDName;
    final nodeString = node.toString();
    var isObject = false;

    if (methodName == "Query" ||
        methodName == "Mutation" ||
        methodName == "Subscription") {
      var argsList = node.argumentList.arguments;
      var args = "";
      if (argsList.isNotEmpty) {
        final arg = argsList.first.toSource();
        args = "(${arg.substring(1, arg.length - 1).replaceAll('\\\$', "\$")})";
      }
      print("Muation Args $args");
      query += "${methodName.toLowerCase()} $opName$args { \n";
    } else if (nodeString.startsWith("..")) {
      var bracket = "";
      var alias = "";
      var directive = "";
      var args = "";
      final argsList = node.argumentList.arguments;
      print("Arg First1 ${argsList.firstOrNull.runtimeType}");
      print("Args List $argsList");
      Tuple3<String?, String?, String?>? tuple;
      var objSpread = "";
      if (argsList.isNotEmpty &&
          (argsList.first is CascadeExpression ||
              argsList.first is MethodInvocation ||
              argsList.first is PropertyAccess)) {
        _propsForType.clear(); // its object field
        isObject = true;
        print("Arg First ${argsList.first.runtimeType}");
        bracket = "{ ";
        if (argsList.first is MethodInvocation) {
          // object invoked with no specific fields selected so lets query all fields
          final objectName = argsList.first.toString().replaceAll("()", "");
          try {
            objSpread = GraphqlAstUtils.getObjectQuery(
                objectName: objectName, apiUrl: apiUrl);
          } catch (e) {
            throw ArgumentError.value(
                "Error in getting full object query of $objectName specify fields you need");
          }
        }
        if (argsList.length > 1) {
          tuple = _getAliasArgsAndDirective(argsList.sublist(1));
        }
      } else {
        // scalar field
        if (argsList.isNotEmpty) {
          tuple = _getAliasArgsAndDirective(argsList);
        }
      }
      print("Tuple $tuple");
      if (tuple != null) {
        final item1 = tuple.item1;
        if (item1 != null) {
          alias = "$item1: ";
        }
        final item2 = tuple.item2;
        if (item2 != null) {
          args = "($item2)";
        }
        final item3 = tuple.item3;
        if (item3 != null) {
          directive = item3;
        }
      }
      if (methodName.startsWith("unionfrag_")) {
        methodName = "... on ${methodName.replaceFirst("unionfrag_", "")}";
        objSpread = "__typename\n";
      }
      if (methodName.startsWith("interfacefrag_")) {
        methodName = "... on ${methodName.replaceFirst("interfacefrag_", "")}";
        objSpread = "__typename\n";
      }
      query += "$alias $methodName$args $directive $bracket \n $objSpread";
    } else if (nodeString.endsWith("()")) {
      // object constructor
      _propsForType.clear();
    }
    super.visitMethodInvocation(node);
    print("method invcation leave $node");
    if (isObject) {
      query += " }\n";
    }
  }

  Tuple3<String?, String?, String?> _getAliasArgsAndDirective(
      List<Expression> argsList) {
    String? alias;
    final args = <String>[];
    String? directive;
    argsList.forEach((e) {
      if (e is NamedExpression) {
        final name = e.name.label.name;
        logger.shout("Arg Type ${e.expression.runtimeType}");
        var value = e.expression.toString();
        if (name == "alias") {
          alias = value.substring(1, value.length - 1);
        } else if (name == "directive") {
          directive = value.substring(1, value.length - 1);
        } else {
          args.add(_getFieldArg(e));
        }
      }
    });

    return Tuple3(alias, args.isEmpty ? null : args.join(", "), directive);
  }

  String _getFieldArg(NamedExpression e) {
    final name = e.name.label.name.removeDName;
    final valueE = e.expression;
    var value = "";
    final valueStr = e.expression.toString();
    if (valueStr.startsWith("\"\\\$") || valueStr.startsWith("\'\\\$")) {
      // query variable
      value = valueStr.substring(2, valueStr.substring(1).indexOf("\"") + 1);
    } else if (valueE is PrefixedIdentifier) {
      // enum
      value = valueStr.split(".").last;
    } else if (valueE is MethodInvocation) {
      logger.shout("Input object $valueStr");
      // input object
      final visitor = ObjectArgVisitor();
      valueE.visitChildren(visitor);
      value = visitor.arg + " } ";
    } else if (_isEnumList(valueE)) {
      final ve = valueE as ListLiteral;
      final vls =
          ve.elements.map((e) => e.toString().split(".").last).join(", ");
      value = "[$vls]";
    } else if (_isObjectList(valueE)) {
      final ve = valueE as ListLiteral;
      final vls = ve.elements.map((e) {
        final visitor = ObjectArgVisitor();
        valueE.visitChildren(visitor);
        value = visitor.arg + " } ";
        return value;
      }).join(", ");
      value = "[$vls]";
    } else {
      value = valueStr;
    }
    return "$name: $value";
  }
}

bool _isEnumList(Expression e) {
  var result = false;
  if (e is ListLiteral) {
    final f = e.elements.firstOrNull;
    if (f is MethodInvocation || f is PrefixedIdentifier) {
      result = true;
    }
  }
  return result;
}

bool _isObjectList(Expression e) {
  var result = false;
  if (e is ListLiteral) {
    final f = e.elements.firstOrNull;
    if (f is MethodInvocation) {
      result = true;
    }
  }
  return result;
}

class ObjectArgVisitor extends RecursiveAstVisitor<Object> {
  var arg = "{ ";
  var _addPrefixIdentifier = false;
  @override
  Object? visitMethodInvocation(MethodInvocation node) {
    print("visitMethodInvocation enter $node");

    arg += "{ ";
    super.visitMethodInvocation(node);
    print("visitMethodInvocation leave $node");
    arg += " }, ";
  }

  @override
  Object? visitPrefixedIdentifier(PrefixedIdentifier node) {
    if (_addPrefixIdentifier) {
      arg += "${node.name.split(".").last},";
    }
    return super.visitPrefixedIdentifier(node);
  }

  @override
  Object? visitArgumentList(ArgumentList node) {
    return super.visitArgumentList(node);
  }

  @override
  Object? visitNamedExpression(NamedExpression node) {
    print("visitNamedExpression $node");
    _addPrefixIdentifier = false;
    var name = node.name.label.name.removeDName;
    final valueE = node.expression;
    var value = "";
    final valueStr = node.expression.toString();
    if (valueStr.startsWith("\"\\\$") || valueStr.startsWith("\'\\\$")) {
      // query variable
      value = valueStr.substring(2, valueStr.substring(1).indexOf("\"") + 1);
    } else if (valueE is PrefixedIdentifier) {
      // enum
      value = valueStr.split(".").last;
    } else if (valueE is MethodInvocation) {
      value = "";
    } else if (_isEnumList(valueE) || _isObjectList(valueE)) {
      if (_isEnumList(valueE)) {
        _addPrefixIdentifier = true;
      }
      value = "";
    } else {
      value = valueStr;
    }
    arg += "$name: $value${value.isEmpty ? "" : ", "}";
    return super.visitNamedExpression(node);
  }

  @override
  Object? visitListLiteral(ListLiteral node) {
    final addList = _isEnumList(node) || _isObjectList(node);
    if (addList) {
      arg += "[ ";
    }
    super.visitListLiteral(node);
    if (addList) {
      arg += " ],";
    }
  }

  @override
  Object? visitSimpleIdentifier(SimpleIdentifier node) {
    return super.visitSimpleIdentifier(node);
  }
}
