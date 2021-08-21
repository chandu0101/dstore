import 'dart:io';

import 'package:test/test.dart';

final rules = """
   rules_version = '2';
   service cloud.firestore {
      match /databases/{database}/documents {
         
             
     
     match /users/{document} {
       allow read: true; 
       allow write: false;
       
       
        
       
       

            
     
     match /messages/{document} {
        
       
       
       
       allow get: true; 
       
       

       
     }
   
     }
   
      }
   } 
""";
void main() {
  group("firebase", () {
    test("firestore", () async {
      final resp = await File(
              "/Users/chandrasekharkode/Desktop/kode/programming/dart_projects/dstore/dstore_test_suite/firestore-rules")
          .readAsString();
      expect(resp.trim(), rules.trim());
    });
  });
}
