import 'dart:convert';

import 'package:crypto/crypto.dart';

abstract class CryptoUtils {
  static String getSHA256Hash(String input) {
    final codeUnits = utf8.encode(input);
    return sha256.convert(codeUnits).toString();
  }
}
