import 'dart:io';

import 'package:test/test.dart';

final schema = """
enum Enum1  {
     one
two
three
   }
   

      interface Node   {
    id: ID! 
    
   }
  

        type Person implements Node  {
    name: String! 
middleName: String 
address: Address! 
    
   }
  
     type Address   {
    houseNo: String! 
    
   }
  
     type Hello   {
    name: String! 
    
   }
  
   
      union Union1 = Person | Hello 
  

      input Input1   {
    name: String! 
   }
""";

void main() {
  group("dgraph schema", () {
    test("should generate objects, enums interfaces, inputs", () async {
      final fileContent = await File(
              "/Users/chandrasekharkode/Desktop/kode/programming/dart_projects/dstore/dstore_test_suite/dgrpah.graphql")
          .readAsString();
      expect(fileContent.trim(), schema.trim());
    });
  });
}
