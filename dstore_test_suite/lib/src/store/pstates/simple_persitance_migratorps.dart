import 'package:dstore/dstore.dart';
part 'simple_persitance_migratorps.ps.dstore.dart';
part 'simple_persitance_migratorps.g.dart';

final simplePersistMigratorTypename = _SimplePersitanceMigrator_FullPath;

@PState(persist: true, persitMigrator: simplePersitanceMigratorFn)
class $_SimplePersitanceMigrator {
  String name = "default";
}

Map<String, dynamic> simplePersitanceMigratorFn(
    String version, Map<String, dynamic> oldJson, dynamic defaultState) {
  print("simplePersitanceMigratorFn $version $oldJson def $defaultState");
  defaultState = defaultState as SimplePersitanceMigrator;
  final json = <String, dynamic>{...oldJson};
  json["name"] = "${defaultState.name}migrated";
  return json;
}
