import 'package:dstore/dstore.dart';
import 'package:dstore_test_suite/src/store/api/graphql/dgraph/interfaces.dart';

abstract class Person implements Node {
  late String name;
  late String? middleName;
  late Address address;
}

abstract class Hello {
  late String name;
}

abstract class Address {
  late String houseNo;
}

abstract class Objects implements Person, Address, Hello {}

abstract class Union1 implements Person, Hello {}

abstract class Unions implements Union1 {}
