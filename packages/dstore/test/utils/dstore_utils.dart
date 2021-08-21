import 'package:dstore/src/utils/dstore_utils.dart';
import 'package:test/test.dart';

enum E1 { one, two }
void main() {
  group("dstore  utils", () {
    test("isEnum", () {
      expect(DStoreUtils.isEnum(E1.one), true);
      expect(DStoreUtils.isEnum(E1.two), true);
      expect(DStoreUtils.isEnum("E1.one"), false);
      expect(DStoreUtils.isEnum(null), false);
    });
  });
}
