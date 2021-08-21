import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dstore_generator/src/pstate/types.dart';
import 'package:dstore_generator/src/utils/utils.dart';

List<StreamFieldInfo> getStreamFields(List<FieldElement> fields) {
  final result = <StreamFieldInfo>[];
  fields.forEach((element) {
    final sfi = _getStreamFieldInfoForElement(element);
    if (sfi != null) {
      result.add(sfi);
    }
  });
  return result;
}

StreamFieldInfo? _getStreamFieldInfoForElement(FieldElement element) {
  final type = element.type;
  logger.shout("getting StreamField $type");
  if (type.toString().startsWith("StreamField") && type is InterfaceType) {
    if (type.typeArguments.length != 2) {
      throw ArgumentError.value(
          "You should provide Stream response type as StreamField typeArg");
    }
    final typeArgs = type.typeArguments;
    final dataTYpe = typeArgs.first.toString();
    final errorType = typeArgs.last.toString();
    return StreamFieldInfo(
        outputType: dataTYpe, errorType: errorType, name: element.name);
  }
  return null;
}

String convertStreamFieldInfoToAction(
    {required StreamFieldInfo sfi,
    required String type,
    bool psHistoryEnabled = false}) {
  final name = sfi.name;
  final mockType = "Iterable<${sfi.outputType}>";
  var psHistoryPayload = "";
  if (psHistoryEnabled) {
    psHistoryPayload =
        ",psHistoryPayload : PSHistoryPayload(keysModified:['${name}'])";
  }
  return """
   static Action<$mockType> $name({required Stream<${sfi.outputType}> stream,bool cancelOnError = false,bool appendDataToList = false,$mockType? mock}) {
     return Action<$mockType>(name:"$name",type:$type,mock: mock,stream:StreamPayload<${sfi.outputType}>(stream: stream,cancelOnError:cancelOnError,appendDataToList : appendDataToList)$psHistoryPayload);
   }

   static Action<$mockType> ${name}Result($mockType mock) {
     return Action<$mockType>(name:"$name",type:$type,mock: mock,$psHistoryPayload);
   }
  """;
}
