import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_generator/src/utils/utils.dart';

String createAppState(FunctionElement element) {
  final name = element.name.substring(2);
  final fields = element.parameters;
  final copyWithMapBody = fields
      .map((f) =>
          "..${f.name} = map.containsKey('${f.name}') ? map['${f.name}'] as ${f.type} : this.${f.name}")
      .join("\n");

  final copyWithMap =
      "${name} copyWithMap(Map<String,dynamic> map) => ${name}()${copyWithMapBody};";

  final toMap =
      """Map<String,PStateModel<dynamic>> toMap() => <String,PStateModel<dynamic>>{${fields.map((f) => """ "${f.name}" : this.${f.name} """).join(", ")}};""";

  final finalFields =
      fields.map((f) => "late final ${f.type}  ${f.name};").join("\n");

  final meta =
      "<String,PStateMeta>{${fields.map((f) => '"${f.name}" : ${f.type}Meta').join(", ")}}";

  final createStore = """
    
    Store<$name> createStore({required StoreErrorHandle handleError, List<Middleware<$name>>? middlewares,
    StorageOptions? storageOptions,
    NetworkOptions? networkOptions,
    bool useEqualsComparision = false}) {
      return Store<$name>(internalMeta :$meta ,
      stateCreator: () => $name(),
      appVersion: '${DBuilderOptions.psBuilderOptions.appVersion}',
      networkOptions:networkOptions,
      middlewares:middlewares,
      handleError:handleError,
      storageOptions: storageOptions,
      useEqualsComparision: useEqualsComparision);
    }
  
  """;
  return """
      class $name implements AppStateI<$name> {
        $finalFields
        @override
        ${copyWithMap}
        @override
        ${toMap}
      }
     ${createStore}
    """;
}
