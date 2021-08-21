// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_persitance_migratorps.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
@JsonSerializable()
class SimplePersitanceMigrator extends PStateModel<SimplePersitanceMigrator> {
  final String name;

  _$SimplePersitanceMigratorCopyWith<SimplePersitanceMigrator> get copyWith =>
      __$SimplePersitanceMigratorCopyWithImpl<SimplePersitanceMigrator>(
          this, IdentityFn);

  SimplePersitanceMigrator({this.name = "default"});

  @override
  SimplePersitanceMigrator copyWithMap(Map<String, dynamic> map) =>
      SimplePersitanceMigrator(
          name: map.containsKey("name") ? map["name"] as String : this.name);

  Map<String, dynamic> toMap() => <String, dynamic>{"name": this.name};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SimplePersitanceMigrator && o.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => "SimplePersitanceMigrator(name: ${this.name})";

  factory SimplePersitanceMigrator.fromJson(Map<String, dynamic> json) =>
      _$SimplePersitanceMigratorFromJson(json);

  Map<String, dynamic> toJson() => _$SimplePersitanceMigratorToJson(this);
}

abstract class $SimplePersitanceMigratorCopyWith<O> {
  factory $SimplePersitanceMigratorCopyWith(SimplePersitanceMigrator value,
          O Function(SimplePersitanceMigrator) then) =
      _$SimplePersitanceMigratorCopyWithImpl<O>;
  O call({String name});
}

class _$SimplePersitanceMigratorCopyWithImpl<O>
    implements $SimplePersitanceMigratorCopyWith<O> {
  final SimplePersitanceMigrator _value;
  final O Function(SimplePersitanceMigrator) _then;
  _$SimplePersitanceMigratorCopyWithImpl(this._value, this._then);

  @override
  O call({Object? name = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String));
  }
}

abstract class _$SimplePersitanceMigratorCopyWith<O>
    implements $SimplePersitanceMigratorCopyWith<O> {
  factory _$SimplePersitanceMigratorCopyWith(SimplePersitanceMigrator value,
          O Function(SimplePersitanceMigrator) then) =
      __$SimplePersitanceMigratorCopyWithImpl<O>;
  O call({String name});
}

class __$SimplePersitanceMigratorCopyWithImpl<O>
    extends _$SimplePersitanceMigratorCopyWithImpl<O>
    implements _$SimplePersitanceMigratorCopyWith<O> {
  __$SimplePersitanceMigratorCopyWithImpl(SimplePersitanceMigrator _value,
      O Function(SimplePersitanceMigrator) _then)
      : super(_value, (v) => _then(v));

  @override
  SimplePersitanceMigrator get _value => super._value;

  @override
  O call({Object? name = dimmutable}) {
    return _then(SimplePersitanceMigrator(
        name: name == dimmutable ? _value.name : name as String));
  }
}

const _SimplePersitanceMigrator_FullPath =
    "/store/pstates/simple_persitance_migratorps/SimplePersitanceMigrator";

abstract class SimplePersitanceMigratorActions {}

SimplePersitanceMigrator SimplePersitanceMigrator_DS() =>
    SimplePersitanceMigrator(name: "default");

final SimplePersitanceMigratorMeta = PStateMeta<SimplePersitanceMigrator>(
    type: _SimplePersitanceMigrator_FullPath,
    ds: SimplePersitanceMigrator_DS,
    sm: PStateStorageMeta<SimplePersitanceMigrator, Map<String, dynamic>>(
        serializer: SimplePersitanceMigratorStorageSerializer,
        deserializer: SimplePersitanceMigratorStorageDeserializer,
        migrator: simplePersitanceMigratorFn));

dynamic SimplePersitanceMigratorStorageSerializer(dynamic value) {
  final s = value as SimplePersitanceMigrator;
  return s.toJson();
}

SimplePersitanceMigrator SimplePersitanceMigratorStorageDeserializer(
    dynamic value) {
  return SimplePersitanceMigrator.fromJson(value as Map<String, dynamic>);
}
