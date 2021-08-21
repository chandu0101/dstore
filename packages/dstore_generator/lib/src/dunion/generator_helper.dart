import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:dstore_generator/src/dunion/types.dart';
import 'package:dstore_generator/src/utils/utils.dart';

Future<String> generateUnion(
    FunctionElement element, BuildStep buildStep) async {
  final name = element.name.substring(2);
  final members = element.parameters.map((pe) {
    return _convertParameterElementToUnionMemebr(pe, name);
  }).toList();
  return _createUnionModel(members: members, name: name);
}

UnionMember _convertParameterElementToUnionMemebr(
    ParameterElement pe, String modelName) {
  var fields = <Field>[];
  var dartType = pe.type;
  String type;
  if (dartType is FunctionType) {
    type = "_${modelName}_${pe.name}";
    fields = dartType.parameters
        .map((pei) => _convertParameterEleemntToField(pei))
        .toList();
  } else {
    type = dartType.toString();
  }
  return UnionMember(name: pe.name, fields: fields, type: type);
}

Field _convertParameterEleemntToField(ParameterElement pe) {
  final name = pe.name;
  final type = pe.type.toString();
  var isOptional = pe.isOptional;
  if (type.endsWith("?")) {
    isOptional = true;
  }
  return Field(name: name, type: type, isOptional: isOptional);
}

String _createUnionModel(
    {required List<UnionMember> members, required String name}) {
  final newCallses = members
      .where((m) => m.fields.isNotEmpty)
      .map((e) => _convertsUnionMemebrsToClass(e))
      .join("\n");
  final ctors = members.map((m) {
    if (m.fields.isNotEmpty) {
      final params = m.fields.map((f) {
        if (!f.isOptional && !f.isNamed) {
          return "required ${f.type} ${f.name}";
        } else {
          return "${f.type} ${f.name}";
        }
      }).join(", ");
      return "${name}.${m.name}({$params}):_value = ${m.type}(${m.fields.map((e) => "${e.name} : ${e.name}").join(", ")});";
    } else {
      return "${name}.${m.name}(${m.type} value):_value = value;";
    }
  }).join("\n");

  final getters = members
      .map((e) =>
          "${e.type}? get ${e.name} => _value is ${e.type} ? _value as ${e.type} : null;")
      .join("\n");

  return """
    
    class $name {
      
    final dynamic _value;
     
     $ctors

     $getters

     ${_getWhenMethod(members)}
     
    }
    
    $newCallses
  """;
}

String _getWhenMethod(List<UnionMember> members) {
  final params = members.map((e) {
    return "required T Function(${e.type} value) ${e.name}";
  }).join(", ");
  final conditios = members.mapIndexed((index, t) {
    var prefix = "";
    if (index == 0) {
      prefix = "if(_value is ${t.type})";
    } else if (index + 1 == members.length) {
      prefix = "else ";
    } else {
      prefix = "else if(_value is ${t.type})";
    }
    return """
        $prefix {
          return ${t.name}(_value as ${t.type});
        }
      """;
  }).join("\n");
  return """
   T when<T>({$params}) {
     $conditios
   }
  """;
}

String _convertsUnionMemebrsToClass(UnionMember m) {
  final name = m.type;
  final fields = m.fields;
  final isJson = false;
  final typeParamsWithBounds = "";
  final typeParams = "";
  return """
     
     class ${m.type} {
        ${ModelUtils.getFinalFieldsFromFieldsList(fields)}
        ${ModelUtils.getCopyWithField(name)}
        ${ModelUtils.createConstructorFromFieldsList(name, fields, addConst: false)}
        
        ${ModelUtils.createEqualsFromFieldsList(name, fields)}

        ${ModelUtils.createHashcodeFromFieldsList(fields)}

        ${ModelUtils.createToStringFromFieldsList(name, fields)}

        ${isJson ? ModelUtils.createFromJson(name) : ""}

        ${isJson ? ModelUtils.createToJson(name) : ""}
     }

     ${ModelUtils.createCopyWithClasses(name: name, fields: fields, typeParamsWithBounds: typeParamsWithBounds, typeParams: typeParams)}
   
   """;
}
