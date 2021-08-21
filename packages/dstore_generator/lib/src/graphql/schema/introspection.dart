import 'package:gql/ast.dart';
import 'package:gql/schema.dart';
import 'package:json_annotation/json_annotation.dart';
part "introspection.g.dart";

class IntrospectionOptions {
  final bool descriptions;
  final bool specifiedByUrl;
  final bool directiveIsRepeatable;
  final bool schemaDescription;
  final bool inputValueDeprecation;

  const IntrospectionOptions(
      {this.descriptions = true,
      this.specifiedByUrl = false,
      this.directiveIsRepeatable = false,
      this.schemaDescription = false,
      this.inputValueDeprecation = false});
}

String getIntrospectionQuery(
    [IntrospectionOptions options = const IntrospectionOptions()]) {
  final descriptions = options.descriptions ? "description" : "";
  final specifiedByUrl = options.specifiedByUrl ? "specifiedByUrl" : "";
  final directiveIsRepeatable =
      options.directiveIsRepeatable ? "directiveIsRepeatable" : "";
  final schemaDescription = options.schemaDescription ? descriptions : "";
  String inputDeprecation(String str) {
    return options.inputValueDeprecation ? str : "";
  }

  return """query IntrospectionQuery {
      __schema {
        ${schemaDescription}
        queryType { name }
        mutationType { name }
        subscriptionType { name }
        types {
          ...FullType
        }
        directives {
          name
          ${descriptions}
          ${directiveIsRepeatable}
          locations
          args${inputDeprecation('(includeDeprecated: true)')} {
            ...InputValue
          }
        }
      }
    }

    fragment FullType on __Type {
      kind
      name
      ${descriptions}
      ${specifiedByUrl}
      fields(includeDeprecated: true) {
        name
        ${descriptions}
        args${inputDeprecation('(includeDeprecated: true)')} {
          ...InputValue
        }
        type {
          ...TypeRef
        }
        isDeprecated
        deprecationReason
      }
      inputFields${inputDeprecation('(includeDeprecated: true)')} {
        ...InputValue
      }
      interfaces {
        ...TypeRef
      }
      enumValues(includeDeprecated: true) {
        name
        ${descriptions}
        isDeprecated
        deprecationReason
      }
      possibleTypes {
        ...TypeRef
      }
    }

    fragment InputValue on __InputValue {
      name
      ${descriptions}
      type { ...TypeRef }
      defaultValue
      ${inputDeprecation('isDeprecated')}
      ${inputDeprecation('deprecationReason')}
    }

    fragment TypeRef on __Type {
      kind
      name
      ofType {
        kind
        name
        ofType {
          kind
          name
          ofType {
            kind
            name
            ofType {
              kind
              name
              ofType {
                kind
                name
                ofType {
                  kind
                  name
                  ofType {
                    kind
                    name
                  }
                }
              }
            }
          }
        }
      }
    }
  """;
}

@JsonSerializable(createToJson: false)
class IntrospectionQuery {
  @JsonKey(name: "__schema", nullable: false)
  late final IntrospectionSchema g__schema;
  IntrospectionQuery();
  factory IntrospectionQuery.fromJson(Map<String, dynamic> json) =>
      _$IntrospectionQueryFromJson(json);
}

@JsonSerializable(createToJson: false)
class IntrospectionSchema {
  @JsonKey(nullable: false)
  late final IntrospectionNamedTypeRef queryType;
  late final IntrospectionNamedTypeRef? mutationType;
  late final IntrospectionNamedTypeRef? subscriptionType;
  @JsonKey(nullable: false)
  late final List<IntrospectionType> types;
  @JsonKey(nullable: false)
  late final List<IntrospectionDirective> directives;
  IntrospectionSchema();
  factory IntrospectionSchema.fromJson(Map<String, dynamic> json) =>
      _$IntrospectionSchemaFromJson(json);
}

@JsonSerializable(createToJson: false)
class IntrospectionNamedTypeRef {
  late final String name;
  IntrospectionNamedTypeRef();
  factory IntrospectionNamedTypeRef.fromJson(Map<String, dynamic> json) =>
      _$IntrospectionNamedTypeRefFromJson(json);
}

@JsonSerializable(createToJson: false)
class IntrospectionType {
  IntrospectionType();

  @JsonKey(nullable: false)
  late final IntrospectionTypeKind kind;
  late final String name;
  late final String? description;
  late final List<IntrospectionField>? fields;
  late final List<IntrospectionInputValue>? inputFields;
  late final List<IntrospectionTypeRef>? interfaces;
  late final List<IntrospectionEnumValue>? enumValues;
  late final List<IntrospectionTypeRef>? possibleTypes;

  factory IntrospectionType.fromJson(Map<String, dynamic> json) =>
      _$IntrospectionTypeFromJson(json);
}

@JsonSerializable(createToJson: false)
class IntrospectionField {
  late final String name;
  late final String? description;
  late final List<IntrospectionInputValue> args;
  late final IntrospectionTypeRef type;
  late final bool isDeprecated;
  late final String? deprecationReason;

  IntrospectionField();
  factory IntrospectionField.fromJson(Map<String, dynamic> json) =>
      _$IntrospectionFieldFromJson(json);
}

@JsonSerializable(createToJson: false)
class IntrospectionInputValue {
  late final String name;
  late final String? description;
  late final IntrospectionTypeRef type;
  late final String? defaultValue;
  late final bool? isDeprecated;
  late final String? deprecationReason;

  IntrospectionInputValue();
  factory IntrospectionInputValue.fromJson(Map<String, dynamic> json) =>
      _$IntrospectionInputValueFromJson(json);
}

enum IntrospectionTypeRefKind {
  ENUM,
  INPUT_OBJECT,
  SCALAR,
  NON_NULL,
  LIST,
  OBJECT,
  INTERFACE,
  UNION
}
enum IntrospectionTypeKind {
  ENUM,
  INPUT_OBJECT,
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION
}

@JsonSerializable(createToJson: false)
class IntrospectionEnumValue {
  late final String name;
  late final String? description;
  late final String? deprecationReason;
  late final bool isDeprecated;
  IntrospectionEnumValue();

  factory IntrospectionEnumValue.fromJson(Map<String, dynamic> json) =>
      _$IntrospectionEnumValueFromJson(json);
}

@JsonSerializable(createToJson: false)
class IntrospectionTypeRef {
  late final IntrospectionTypeRefKind kind;
  late final String? name;
  late final IntrospectionTypeRef? ofType;

  IntrospectionTypeRef();
  factory IntrospectionTypeRef.fromJson(Map<String, dynamic> json) =>
      _$IntrospectionTypeRefFromJson(json);
}

enum DirectiveLocationEnum {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,

  // Type System Definitions
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
}

@JsonSerializable(createToJson: false)
class IntrospectionDirective {
  late final String name;
  late final String? description;
  late final bool? isRepeatable;
  late final List<IntrospectionInputValue> args;
  late final List<DirectiveLocationEnum> locations;

  IntrospectionDirective();
  factory IntrospectionDirective.fromJson(Map<String, dynamic> json) =>
      _$IntrospectionDirectiveFromJson(json);
}

GraphQLSchema buildSchemaFromIntrospection(IntrospectionQuery query) {
  final schema = query.g__schema;
  final typesMap = Map.fromEntries(schema.types.map((t) {
    late TypeDefinition type;
    switch (t.kind) {
      case IntrospectionTypeKind.ENUM:
        type = buildEnumTypeDef(t);
        break;
      case IntrospectionTypeKind.INPUT_OBJECT:
        type = buildInputObjectTypeDef(t);
        break;
      case IntrospectionTypeKind.SCALAR:
        type = buildScalaTypeDef(t);
        break;
      case IntrospectionTypeKind.OBJECT:
        type = buildObjectTypeDef(t);
        break;
      case IntrospectionTypeKind.INTERFACE:
        type = buildInterfaceTypeDef(t);
        break;
      case IntrospectionTypeKind.UNION:
        type = buildUnionTypeDef(t);
        break;
    }
    return MapEntry(t.name, type);
  }));

  final ops = <OperationTypeDefinitionNode>[
    OperationTypeDefinitionNode(
        operation: OperationType.query,
        type: NamedTypeNode(name: NameNode(value: schema.queryType.name)))
  ];
  // TODO recheck, currently GraphqlSchema.query fetches QueryType from typeMap["query"] it should pic from schema def!
  typesMap["query"] = typesMap[schema.queryType.name]!;
  if (schema.mutationType != null) {
    ops.add(OperationTypeDefinitionNode(
        operation: OperationType.mutation,
        type: NamedTypeNode(name: NameNode(value: schema.mutationType!.name))));
    // TODO recheck, currently GraphqlSchema.mutation fetches MutationType from typeMap["mutation"] it shosuld pic from schemadef
    typesMap["mutation"] = typesMap[schema.mutationType!.name]!;
  }
  if (schema.subscriptionType != null) {
    ops.add(OperationTypeDefinitionNode(
        operation: OperationType.subscription,
        type: NamedTypeNode(
            name: NameNode(value: schema.subscriptionType!.name))));
    // TODO recheck, currently GraphqlSchema.subscription fetches Subscription from typeMap["subscription"] it shosuld pic from schemadef
    typesMap["subscription"] = typesMap[schema.subscriptionType!.name]!;
  }
  final directives = schema.directives.map(buildDirectiveDef).toList();

  return GraphQLSchema(SchemaDefinitionNode(operationTypes: ops),
      typeMap: typesMap, directives: directives);
}

StringValueNode? _getDescription(String? description) {
  return description != null
      ? StringValueNode(value: description, isBlock: false)
      : null;
}

ScalarTypeDefinition buildScalaTypeDef(IntrospectionType scalaIntroSpection) {
  return ScalarTypeDefinition(ScalarTypeDefinitionNode(
      name: NameNode(value: scalaIntroSpection.name),
      description: _getDescription(scalaIntroSpection.description)));
}

EnumTypeDefinition buildEnumTypeDef(IntrospectionType enumIntrospection) {
  if (enumIntrospection.enumValues == null) {
    throw Exception(
        "Introspection result missing enum values : ${enumIntrospection.name}");
  }
  final values = enumIntrospection.enumValues!
      .map((e) => EnumValueDefinitionNode(
            name: NameNode(value: e.name),
            description: _getDescription(e.description),
          ))
      .toList();
  return EnumTypeDefinition(EnumTypeDefinitionNode(
      name: NameNode(value: enumIntrospection.name),
      description: _getDescription(enumIntrospection.description),
      values: values));
}

TypeNode _convertIntroSpectionTypeRefToTypeNode(IntrospectionTypeRef typeRef,
    [bool isNonNull = false]) {
  if (typeRef.kind == IntrospectionTypeRefKind.LIST) {
    if (typeRef.ofType == null) {
      throw Exception("Decorated type deeper than introspection query.");
    }
    return ListTypeNode(
        type: _convertIntroSpectionTypeRefToTypeNode(typeRef.ofType!),
        isNonNull: isNonNull);
  }
  if (typeRef.kind == IntrospectionTypeRefKind.NON_NULL) {
    if (typeRef.ofType == null) {
      throw Exception("Decorated type deeper than introspection query.");
    }
    return _convertIntroSpectionTypeRefToTypeNode(typeRef.ofType!, true);
  }

  return NamedTypeNode(
      name: NameNode(value: typeRef.name!), isNonNull: isNonNull);
}

InputObjectTypeDefinition buildInputObjectTypeDef(
    IntrospectionType inputIntrospection) {
  if (inputIntrospection.inputFields == null) {
    throw Exception(
        "Introspection result missing inputFields: ${inputIntrospection.name}");
  }
  final fields = inputIntrospection.inputFields!
      .map(_buildInputValueDefinitionNode)
      .toList();
  return InputObjectTypeDefinition(InputObjectTypeDefinitionNode(
      name: NameNode(value: inputIntrospection.name),
      fields: fields,
      description: _getDescription(inputIntrospection.description)));
}

InputValueDefinitionNode _buildInputValueDefinitionNode(
    IntrospectionInputValue i) {
  return InputValueDefinitionNode(
      name: NameNode(value: i.name),
      description: _getDescription(i.description),
      type: _convertIntroSpectionTypeRefToTypeNode(i.type));
}

FieldDefinitionNode _buildFieldDefinitionNode(IntrospectionField i) {
  return FieldDefinitionNode(
      name: NameNode(value: i.name),
      description: _getDescription(i.description),
      args: i.args.map(_buildInputValueDefinitionNode).toList(),
      type: _convertIntroSpectionTypeRefToTypeNode(i.type));
}

ObjectTypeDefinition buildObjectTypeDef(IntrospectionType objectIntrospection) {
  final fields =
      objectIntrospection.fields!.map(_buildFieldDefinitionNode).toList();
  final interfaces = objectIntrospection.interfaces!.map((e) {
    if (e.name == null) {
      throw Exception("Interface Ref should have name");
    }
    return NamedTypeNode(name: NameNode(value: e.name!));
  }).toList();
  return ObjectTypeDefinition(ObjectTypeDefinitionNode(
      name: NameNode(value: objectIntrospection.name),
      description: _getDescription(objectIntrospection.description),
      fields: fields,
      interfaces: interfaces));
}

InterfaceTypeDefinition buildInterfaceTypeDef(
    IntrospectionType interfaceInrospection) {
  final fields =
      interfaceInrospection.fields!.map(_buildFieldDefinitionNode).toList();
  return InterfaceTypeDefinition(InterfaceTypeDefinitionNode(
      name: NameNode(value: interfaceInrospection.name),
      description: _getDescription(interfaceInrospection.description),
      fields: fields));
}

UnionTypeDefinition buildUnionTypeDef(IntrospectionType unionIntrospection) {
  if (unionIntrospection.possibleTypes == null) {
    throw Exception(
        "Introspection result missing possible type ${unionIntrospection.name}");
  }
  final types = unionIntrospection.possibleTypes!.map((e) {
    if (e.name == null) {
      throw Exception("Possible type name cannot be null");
    }
    return NamedTypeNode(name: NameNode(value: e.name!));
  }).toList();
  return UnionTypeDefinition(UnionTypeDefinitionNode(
      name: NameNode(value: unionIntrospection.name),
      types: types,
      description: _getDescription(unionIntrospection.description)));
}

DirectiveDefinition buildDirectiveDef(
    IntrospectionDirective directiveIntrospection) {
  final locations = directiveIntrospection.locations.map((e) {
    late DirectiveLocation loc;
    switch (e) {
      case DirectiveLocationEnum.QUERY:
        loc = DirectiveLocation.query;
        break;
      case DirectiveLocationEnum.MUTATION:
        loc = DirectiveLocation.mutation;
        break;
      case DirectiveLocationEnum.SUBSCRIPTION:
        loc = DirectiveLocation.subscription;
        break;
      case DirectiveLocationEnum.FIELD:
        loc = DirectiveLocation.field;
        break;
      case DirectiveLocationEnum.FRAGMENT_DEFINITION:
        loc = DirectiveLocation.fragmentDefinition;
        break;
      case DirectiveLocationEnum.FRAGMENT_SPREAD:
        loc = DirectiveLocation.fragmentSpread;
        break;
      case DirectiveLocationEnum.INLINE_FRAGMENT:
        loc = DirectiveLocation.inlineFragment;
        break;
      case DirectiveLocationEnum.VARIABLE_DEFINITION:
        loc = DirectiveLocation.inputObject;
        break;
      case DirectiveLocationEnum.SCHEMA:
        loc = DirectiveLocation.schema;
        break;
      case DirectiveLocationEnum.SCALAR:
        loc = DirectiveLocation.scalar;
        break;
      case DirectiveLocationEnum.OBJECT:
        loc = DirectiveLocation.object;
        break;
      case DirectiveLocationEnum.FIELD_DEFINITION:
        loc = DirectiveLocation.fieldDefinition;
        break;
      case DirectiveLocationEnum.ARGUMENT_DEFINITION:
        loc = DirectiveLocation.argumentDefinition;
        break;
      case DirectiveLocationEnum.INTERFACE:
        loc = DirectiveLocation.interface;
        break;
      case DirectiveLocationEnum.UNION:
        loc = DirectiveLocation.union;
        break;
      case DirectiveLocationEnum.ENUM:
        loc = DirectiveLocation.enumDefinition;
        break;
      case DirectiveLocationEnum.ENUM_VALUE:
        loc = DirectiveLocation.enumValue;
        break;
      case DirectiveLocationEnum.INPUT_OBJECT:
        loc = DirectiveLocation.inputObject;
        break;
      case DirectiveLocationEnum.INPUT_FIELD_DEFINITION:
        loc = DirectiveLocation.inputFieldDefinition;
        break;
    }
    return loc;
  }).toList();
  final args =
      directiveIntrospection.args.map(_buildInputValueDefinitionNode).toList();
  return DirectiveDefinition(DirectiveDefinitionNode(
      name: NameNode(value: directiveIntrospection.name),
      description: _getDescription(directiveIntrospection.description),
      repeatable: directiveIntrospection.isRepeatable ?? false,
      locations: locations,
      args: args));
}
