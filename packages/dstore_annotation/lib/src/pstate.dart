import 'package:dstore_annotation/dstore_annotation.dart';

typedef PStatePersitMigratorFn = Map<String, dynamic> Function(
    String oldVersion, Map<String, dynamic> data, dynamic defaultState);

/// Annotation to define part of state in whole app state
///  Fields
///  [persist] : whether class(annotated with PState) should be persisted or not ,defualt false
///  [enableHistory] to enableHistory of state for undo redo
///  [historyLimit] used in conjuction with [enableHistory] ,when enableHistory true historyLimit is used as max number of intermediate states
///  [nav] when its true Pstate PState generates code for navigation of app
///  [collectionEquality] used to determine equals(==) method of model class , permitted values enum CollectionEquality { equals, deep_equals, deep_equals_unordered }
///
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

/// when a class annotated with [PState] and [persist] is true, then if you want few fields dont want to
/// persist mark them with @excludeThisKeyWhilePersist
class ExcludeThisKeyWhilePersit {
  const ExcludeThisKeyWhilePersit();
}

/// when a class annotated with [PState] and [persist] is true, then if you want few fields dont want to
/// persist mark them with @excludeThisKeyWhilePersist
const excludeThisKeyWhilePersist = ExcludeThisKeyWhilePersit();
