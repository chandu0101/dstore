import 'package:dstore_generator/src/utils/utils.dart';

class UnionMember {
  final String name;
  final List<Field> fields;
  final String type;

  UnionMember({required this.name, required this.fields, required this.type});
}
