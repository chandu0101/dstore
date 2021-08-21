import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/constants.dart';
import 'package:dstore_generator/src/graphql/ops/typegen.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:gql/ast.dart';
import 'package:gql/schema.dart';

class DuplicateOperationVisitor extends RecursiveVisitor {
  final DocumentNode documentNOde;
  final GraphQLSchema schema;
  bool isMultipleOpsExist = false;
  int _ops = 0;
  late final OperationType? opType;
  DuplicateOperationVisitor(this.documentNOde, this.schema);

  @override
  void visitOperationDefinitionNode(OperationDefinitionNode node) {
    logger.shout("Dups visitOperationDefinitionNode ${node.type}");
    _ops += 1;
    opType = node.type;
    if (_ops > 1) {
      isMultipleOpsExist = true;
      return;
    }
    super.visitOperationDefinitionNode(node);
  }
}

class OperationVisitor extends RecursiveVisitor {
  final DocumentNode documentNode;
  final GraphQLSchema schema;
  final GraphqlApi api;
  OperationVisitor(
      {required this.documentNode, required this.api, required this.schema}) {
    documentNode.definitions.forEach((def) {
      if (def is FragmentDefinitionNode) {
        _fragmentMap[def.name.value] = def;
      }
    });
  }
  final _resultFieldElementStack =
      Stack<FieldTypeElement>(() => FieldTypeElement());
  final _parentTypeStack = Stack<TypeDefinition>();
  final _variableFields = <GField>[];
  final _fragmentMap = <String, FragmentDefinitionNode>{};
  final fragmentFieldsMap = <String, ToplevelFragment>{};
  late List<GField> fields;
  late final List<GFragment> fragments;
  late final List<GField> variables;
  late final OperationType opType;
  @override
  void visitOperationDefinitionNode(OperationDefinitionNode node) {
    print("visiting operation ${node.type}");
    if (node.type == OperationType.query) {
      opType = OperationType.query;
      _parentTypeStack.stack(schema.query);
      _resultFieldElementStack.stack();
    } else if (node.type == OperationType.mutation) {
      opType = OperationType.mutation;
      _parentTypeStack.stack(schema.mutation);
      _resultFieldElementStack.stack();
    } else if (node.type == OperationType.subscription) {
      opType = OperationType.subscription;
      _parentTypeStack.stack(schema.subscription);
      _resultFieldElementStack.stack();
    }
    super.visitOperationDefinitionNode(node);
    final fe = _resultFieldElementStack.consume();
    if (fe.fields.isEmpty && fe.typeFragments.isEmpty) {
      throw Exception("You should select fields for query ${node.name?.value}");
    }
    fields = fe.fields;
    fragments = fe.typeFragments;
    variables = _variableFields;
    _parentTypeStack.consume();
  }

  @override
  void visitFragmentDefinitionNode(FragmentDefinitionNode node) {
    print("visitFragmentDefinitionNode Enter ${node.name.value}");
    final onName = node.typeCondition.on.name.value;
    final t = schema.getType(onName);
    _parentTypeStack.stack(t);
    _resultFieldElementStack.stack();
    super.visitFragmentDefinitionNode(node);
    print("visitFragmentDefinitionNode Leave ${node.name.value}");
    final fe = _resultFieldElementStack.consume();
    fragmentFieldsMap[node.name.value] = ToplevelFragment(
        fe.fields, fe.typeFragments, t is UnionTypeDefinition, onName);
    _parentTypeStack.consume();
  }

  @override
  void visitVariableDefinitionNode(VariableDefinitionNode node) {
    super.visitVariableDefinitionNode(node);
    print(
        "variable definition leave ${node.variable.name.value} ${node.defaultValue?.value} ${node.type}");
    final variableName = node.variable.name.value;
    final defaultValue = node.defaultValue?.value
        ?.toString(); //TODO handle array object default variables
    final tm = _getTypeNodeMeta(node.type);
    final td = schema.getType(tm.fieldType);
    print("td: $td ${tm.fieldType}");
    if (!(td is ScalarTypeDefinition) && !(td is InputObjectTypeDefinition)) {
      throw Exception(
          "Variable types hsould be scalar or input object type definition, ${tm.fieldType} is not a scalar or input object");
    }
    var type = tm.fieldType;
    if (td is ScalarTypeDefinition) {
      type = _getScalarType(td);
    }
    _variableFields.add(GField(
      name: variableName,
      defaultValue: defaultValue,
      type: type,
      listType: tm.listType,
      optional: !tm.strict,
    ));
  }

  @override
  void visitFragmentSpreadNode(FragmentSpreadNode node) {
    print("visitFragmentSpreadNode Enter ${node.name.value}");
    super.visitFragmentSpreadNode(node);
    print("visitFragmentSpreadNode Leave ${node.name.value}");
    final name = node.name.value;
    final fragmentDefNode = _fragmentMap[name];
    if (fragmentDefNode == null) {
      throw Exception(
          "Fragment ${name} is not defined, defined fragments are ${_fragmentMap.keys} ");
    }
    final isUnionCondition = _isConcreteTypeOfParentUnionType(
      fragmentDefNode.typeCondition,
      _parentTypeStack.current,
    );
    _resultFieldElementStack.current.typeFragments.add(GFragment(
        isUnionCondition: isUnionCondition, typeNode: node.name.value));
  }

  @override
  void visitInlineFragmentNode(InlineFragmentNode node) {
    print("InLineFragment Enter ${node} ");
    if (node.typeCondition != null) {
      final name = node.typeCondition?.on.name.value;
      final type = schema.getType(name ?? "");
      if (type == null) {
        throw Exception("can not find type ${name}");
      }
      print("Union TYpe $type name ${node.typeCondition?.on.name.value}");
      _parentTypeStack.stack(type);
      _resultFieldElementStack.stack();
    }
    super.visitInlineFragmentNode(node);
    print("InLineFragment Leave $node");
    if (node.typeCondition != null) {
      _parentTypeStack.consume();
      final fe = _resultFieldElementStack.consume();
      if (fe.fields.isEmpty && fe.typeFragments.isEmpty) {
        throw Exception(
            " You should select fields on inline fragment ${node.typeCondition?.on.name.value}");
      }
      final isUnionCondition = _isConcreteTypeOfParentUnionType(
          node.typeCondition!, _parentTypeStack.current);
      _resultFieldElementStack.current.typeFragments.add(GFragment(
          isUnionCondition: isUnionCondition,
          fields: fe.fields,
          on: node.typeCondition?.on.name.value,
          fragments: fe.typeFragments));
    }
  }

  @override
  void visitFieldNode(FieldNode node) {
    // Enter
    print("field enter ${node.name.value}");
    late FieldMetadata fm;
    final fieldName = node.name.value;
    if (fieldName != "__typename") {
      final f = (_parentTypeStack.current as TypeDefinitionWithFieldSet)
          .getField(node.name.value);
      fm = getFieldMetadataFromFieldTypeInstance(f.type!);
      print("field meta $fm");
      if (fm.fieldType is ObjectTypeDefinition ||
          fm.fieldType is InterfaceTypeDefinition ||
          fm.fieldType is UnionTypeDefinition) {
        _parentTypeStack.stack(fm.fieldType);
        _resultFieldElementStack.stack();
      }
      // NamedType
      print("field type ${f.runtimeType} Type  ${f.type.runtimeType} ");
    }

    super.visitFieldNode(node);
    // Leave
    print("Field leave ${fieldName}");
    if (fieldName == "__typename") {
      print("typename found");
      _resultFieldElementStack.current.fields.add(GField(
        name: "d\$___typeName",
        optional: false,
        type: "String",
        listType: [],
        fields: [],
        jsonKey: "__typename",
      ));
    } else {
      final fieldType = fm.fieldType;
      String? type;
      var fields = <GField>[];
      var fragments = <GFragment>[];
      if (fieldType is ScalarTypeDefinition) {
        type = _getScalarType(fieldType);
      } else if (fieldType is EnumTypeDefinition) {
        // enumValues = fieldType.values.map((e) => e.name).toList();
        type = fieldType.name;
      } else if (fieldType is InterfaceTypeDefinition ||
          fieldType is ObjectTypeDefinition ||
          fieldType is UnionTypeDefinition) {
        // fields =
        final fe = _resultFieldElementStack.consume();
        fields = fe.fields;
        fragments = fe.typeFragments;
        print("fields $fields fragments $fragments");
        if (fields.isEmpty && fragments.isEmpty) {
          throw Exception("You should select fields for field ${fieldName}");
        }
        if (fieldType is UnionTypeDefinition && fragments.isEmpty) {
          throw ArgumentError.value(
              "You should seelct one of union memebrs for field $fieldName");
        }
        _parentTypeStack.consume();
      }
      var name = node.alias?.value ?? fieldName;
      String? jsonKey;
      final dname = name.addDName;
      if (dname != name) {
        name = dname;
        jsonKey = name;
      }
      _resultFieldElementStack.current.fields.add(GField(
          name: name,
          listType: fm.listType,
          type: type,
          isUnion: fieldType is UnionTypeDefinition,
          isInterface: fieldType is InterfaceTypeDefinition,
          jsonKey: jsonKey,
          optional: !fm.strict,
          fields: fields,
          fragments: fragments));
      print("field leave ${node.name.value} $fm");
    }
  }

  TypeNodeMeta _getTypeNodeMeta(TypeNode type,
      {List<GListType> list = const []}) {
    print("ftinput ${type.runtimeType} ${type}  $list");
    final listm = List<GListType>.from(list);
    if (type is ListTypeNode) {
      if (type.isNonNull) {
        listm.add(GListType.strict);
      } else {
        listm.add(GListType.nonstrict);
      }
      type = type.type;
    }
    if (type is NamedTypeNode) {
      var strict = false;
      if (type.isNonNull) {
        strict = true;
      }
      var ftd = type.name.value;
      return TypeNodeMeta(fieldType: ftd, listType: listm, strict: strict);
    } else {
      return _getTypeNodeMeta(type, list: listm);
    }
  }

  bool _isConcreteTypeOfParentUnionType(
      TypeConditionNode node, TypeDefinition parentType) {
    if (parentType is UnionTypeDefinition) {
      return parentType.types
          .where((t) => t.name == node.on.name.value)
          .isNotEmpty;
    } else {
      return false;
    }
  }

  String _getScalarType(ScalarTypeDefinition typeDef,
      {Map<String, String>? scalarMap}) {
    return getScalarTypeFromString(typeDef.name ?? "", scalarMap: scalarMap);
  }
}
