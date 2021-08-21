import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/errors.dart';
import 'package:dstore_generator/src/utils/utils.dart';

class FormModelVisitor extends SimpleAstVisitor<dynamic> {
  final fields = <Field>[];
  final validators = <String, String>{};
  final List<FieldElement> fieldElements;
  final String modelName;
  late final String enumName;

  FormModelVisitor(this.fieldElements, this.modelName) {
    this.enumName = "${modelName}Key";
  }
  @override
  void visitFieldDeclaration(FieldDeclaration fd) {
    final typeA = fd.fields.type;
    if (typeA == null) {
      if (typeA == null) {
        throw InvalidSignatureError(
            "Should provide type annotation for fields , specify type for field '${fd.fields.variables.first.name}'");
      }
    }
    final type = typeA.toSource();
    fd.fields.variables.forEach((v) {
      final name = v.name.name;
      final initalValueE = v.initializer;

      if (!v.isLate && !type.endsWith("?") && initalValueE == null) {
        throw InvalidSignatureError(
            "You should provide default value for field '${name}'");
      }
      final value = initalValueE?.toString();
      var isOptional = false;
      if (!v.isLate && value == null) {
        isOptional = true;
      }
      final fe = fieldElements.singleWhere((element) => element.name == name);
      final annotations = fe.metadata.map((e) => e.toSource()).toList();
      final va = fe.annotationFromType(Validator);
      if (va != null) {
        final vao = va.computeConstantValue();
        final fn = vao?.functionNameForField("fn",
            validateFn: _validateFunctionSignature);
        validators["${name}"] = fn!;
      }
      fields.add(Field(
          name: name,
          type: type,
          annotations: annotations,
          isOptional: isOptional,
          value: value));
    });
  }

  String? _validateFunctionSignature(ExecutableElement fn) {
    final rt = fn.returnType.toString();
    if (rt != "String?" && rt != "Future<String?>") {
      return "Return type of validator function ${fn.name} should be String? or Future<String?>";
    }
    if (fn.parameters.length != 2) {
      return "Validator function ${fn.name} should accept two parameters one for field value and an another one for form value";
    }
    //TODO probaly check param type too!
  }
}
