import 'package:dstore/dstore.dart';

class Optional<T> {
  final T value;
  const Optional(this.value);
}

const optionalDefault = Optional(null);

extension StringOptionalExt on String? {
  Optional<String?> get optional => Optional(this);
}

extension NumberOptionalExt on num? {
  Optional<num?> get optional => Optional(this);
}

extension BoolOptionalExt on bool? {
  Optional<bool?> get optional => Optional(this);
}

extension IntOptionalExt on int? {
  Optional<int?> get optional => Optional(this);
}

extension DoubleOptionalExt on double? {
  Optional<double?> get optional => Optional(this);
}

extension NullOptionalExt on Null? {
  dynamic get optional => Optional(this);
}

@optionalTypeArgs
abstract class ToMap<M> {
  Map<String, dynamic> toMap();
  M copyWithMap(Map<String, dynamic> map);
}
