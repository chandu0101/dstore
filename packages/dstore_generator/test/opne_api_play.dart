import 'dart:convert';
import 'dart:io';

import 'package:dstore_generator/src/open_api/generator_helper.dart';

void main() {
  try {
    print("hello");

    final file = "./openapi/petstore.json";
    final content =
        jsonDecode(File(file).readAsStringSync()) as Map<String, dynamic>;
    print(content["paths"]["/pets"]["get"]["tags"].runtimeType);
    // final doc = getDocumentFromFile(file);
    // print(doc);
  } catch (e, st) {
    print("Error : $e");
    print(st);
  }
}
