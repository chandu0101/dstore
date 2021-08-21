import "package:collection/collection.dart";

export "dstore_dev_utils.dart";
export "dstore_utils.dart";

T IdentityFn<T>(T v) => v;

String convertEnumToString(Object enumEntry) {
  final description = enumEntry.toString();
  final indexOfDot = description.indexOf('.');
  assert(
    indexOfDot != -1 && indexOfDot < description.length - 1,
    'The provided object "$enumEntry" is not an enum.',
  );
  return description.substring(indexOfDot + 1);
}

String? convertEnumOrNullToString(Object? enumEntry) {
  if (enumEntry == null) {
    return null;
  }
  final description = enumEntry.toString();
  final indexOfDot = description.indexOf('.');
  assert(
    indexOfDot != -1 && indexOfDot < description.length - 1,
    'The provided object "$enumEntry" is not an enum.',
  );
  return description.substring(indexOfDot + 1);
}

E? convertStringToEnum<E>(String s, List<E> values) {
  return values.firstWhereOrNull((v) => v.toString().split('.')[1] == s);
}

int? convertDurationToMillSeconds(Duration? duration) =>
    duration?.inMilliseconds;

Duration? convertMilliSecondsToDuration(int? milliseconds) =>
    milliseconds != null ? Duration(milliseconds: milliseconds) : null;
