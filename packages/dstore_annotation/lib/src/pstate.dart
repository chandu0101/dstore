import 'package:dstore_annotation/dstore_annotation.dart';

typedef PStatePersitMigratorFn = Map<String, dynamic> Function(
    String oldVersion, Map<String, dynamic> data, dynamic defaultState);

class PState {
  final bool? persist;
  final bool enableHistory;
  final int? historyLimit;
  final bool? nav;
  final bool? navBlockSameUrl;
  // final List<String>? nonConstClassesWithDefaultValues;
  final PStatePersitMigratorFn? persitMigrator;
  final String? interMigratorName;
  final CollectionEquality? collectionEquality;
  const PState(
      {this.persist,
      this.enableHistory = false,
      this.navBlockSameUrl,
      this.historyLimit,
      this.persitMigrator,
      this.interMigratorName,
      // this.nonConstClassesWithDefaultValues,
      this.collectionEquality,
      this.nav});

  @override
  String toString() {
    return 'PState(persist: $persist, enableHistory: $enableHistory, historyLimit: $historyLimit, nav: $nav, navBlockSameUrl: $navBlockSameUrl, persitMigrator: $persitMigrator, interMigratorName: $interMigratorName)';
  }
}

class RegularMethod {
  const RegularMethod();
}

class PSNonConstClassField {
  const PSNonConstClassField();
}

class ExcludeThisKeyWhilePersit {
  const ExcludeThisKeyWhilePersit();
}

const excludeThisKeyWhilePersist = ExcludeThisKeyWhilePersit();
