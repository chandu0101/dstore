import 'package:dstore/dstore.dart';

@collection(name: "users", rules: SecurityRule(read: "true", write: "false"))
abstract class User {
  late String name;
  late double? count;
  late Address? address;
  late Message message;
}

@collection(name: "messages", sub: true, rules: SecurityRule(get: "true"))
abstract class Message {}

abstract class Address {
  late String name;
}

abstract class Collections implements User, Message {}

abstract class NestedObjects implements Address {}
