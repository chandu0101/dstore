class Selectors {
  const Selectors();
}

class AppStateAnnotation {
  const AppStateAnnotation();
}

class DImmutable {
  final bool isJsonSerializable;
  final CollectionEquality? collectionEquality;
  final bool toMap;
  final bool copyWithMap;
  const DImmutable(
      {this.isJsonSerializable = false,
      this.collectionEquality,
      this.toMap = false,
      this.copyWithMap = false});
}

const dimmutable = DImmutable();

class PersistKey {
  final bool ignore;
  const PersistKey({this.ignore = false});
}

class Default {
  const Default(dynamic value);
}

class DEnum {
  const DEnum();
}

class FormModel {
  const FormModel();
}

class Validator {
  final Function fn;
  const Validator(this.fn);
}

class DUnion {
  const DUnion();
}

enum CollectionEquality { equals, deep_equals, deep_equals_unordered }
