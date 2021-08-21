abstract class DStoreUtils {
  static bool isEnum(dynamic value) {
    final a = value.toString().split(".");
    return a.length == 2 && a.first == value.runtimeType.toString();
  }
}
