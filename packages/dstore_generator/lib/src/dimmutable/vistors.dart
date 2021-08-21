import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/utils/utils.dart';

class DImmutableClassVisitor extends SimpleAstVisitor<dynamic> {
  final fields = <Field>[];
  final methods = <String>[];

  @override
  dynamic visitFieldDeclaration(FieldDeclaration node) {
    final type = node.fields.type?.toSource() ?? "dynamic";

    node.fields.variables.forEach((v) {
      final name = v.name.name;
      final value = v.initializer?.toSource();
      fields.add(Field(
          name: name,
          type: type,
          value: value,
          isOptional: type.endsWith("?")));
    });
  }

  @override
  dynamic visitMethodDeclaration(MethodDeclaration node) {
    methods.add(node.toSource());
  }
}

class DImmutableFunctionVisitor extends SimpleAstVisitor<dynamic> {
  final fields = <Field>[];
  @override
  void visitFormalParameterList(FormalParameterList node) {
    print("visitFormalParameterList $node");
    // TODO: implement visitFormalParameterList
    return super.visitFormalParameterList(node);
  }

  @override
  dynamic visitArgumentList(ArgumentList node) {
    print("visitArgument List $node");
    return super.visitArgumentList(node);
  }

  @override
  void visitFunctionExpression(FunctionExpression node) {
    print("visitFunctionExpression $node");
    node.parameters?.parameters.forEach((p) {
      print("Param ${p} ${p.runtimeType}");
      final name = p.identifier!.name;
      var type = "dynamic";
      String? value;

      if (p is SimpleFormalParameter) {
        type = p.type?.toSource() ?? "dynamic";
      } else if (p is DefaultFormalParameter) {
        value = p.defaultValue?.toSource();
        type = (p.parameter as SimpleFormalParameter).type?.toSource() ??
            "dynamic";
      }
      fields.add(Field(
          name: name,
          type: type,
          isOptional: type.endsWith("?"),
          value: value));
    });
    return super.visitFunctionExpression(node);
  }
}
