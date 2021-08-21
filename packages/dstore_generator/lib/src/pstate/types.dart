import 'package:analyzer/dart/ast/ast.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/utils/utils.dart';

class ActionsInfo {
  final String actions;
  final String httpMeta;
  final List<String> specialActions;
  final String? canProcessOfflineAction;

  ActionsInfo(
      {required this.actions,
      required this.httpMeta,
      this.canProcessOfflineAction,
      required this.specialActions});
}

class HttpFieldInfo {
  final String name;
  final String fieldType;
  final String url;
  final String? headers;
  final String? inputType;
  final String? errorType;
  final HttpInputType inputTypeEnum;
  final HttpResponseType responseTypeEnum;
  final String responseDeserializer;
  final String? inputSerializer;
  final String? responseSerializer;
  final String? inputDeserializer;
  final String? transformer;
  final String errorDeserializer;
  final String method;
  final String? queryParamsType;
  final String? canProcessOfflineAction;
  final String? pathParamsType;
  final GraphqlRequestPart? graphqlQuery;
  final String responseType;
  final String? transformType;
  final bool persitDataBetweenFetches;

  HttpFieldInfo({
    required this.name,
    required this.url,
    this.headers,
    this.errorType,
    required this.fieldType,
    this.inputType,
    this.canProcessOfflineAction,
    required this.inputTypeEnum,
    required this.responseType,
    required this.responseTypeEnum,
    this.transformType,
    required this.responseDeserializer,
    required this.errorDeserializer,
    this.responseSerializer,
    this.inputDeserializer,
    this.pathParamsType,
    required this.method,
    this.inputSerializer,
    this.transformer,
    this.persitDataBetweenFetches = false,
    required this.queryParamsType,
    this.graphqlQuery,
  });
}

class WebSocketFieldInfo {
  final String url;
  final String name;
  final GraphqlRequestPart? graphqlQuery;
  final String? inputSerializer;
  final String? responseDeserializer;
  final String? responseType;
  final String? errorType;
  final String? transformer;
  final String inputType;

  WebSocketFieldInfo(
      {required this.url,
      required this.name,
      this.graphqlQuery,
      this.transformer,
      this.errorType,
      this.responseType,
      required this.inputType,
      this.inputSerializer,
      this.responseDeserializer});
}

class StreamFieldInfo {
  final String outputType;
  final String name;
  final String errorType;

  StreamFieldInfo(
      {required this.name, required this.outputType, required this.errorType});
}

class PStateMethod {
  final String name;
  final List<Field> params;
  final String body;
  final bool isAsync;
  final String? url;
  final bool isNavProtected;
  final String? nestedNavTypeName;
  final List<Field> keysModified;
  final bool isRegular;

  PStateMethod(
      {required this.isAsync,
      required this.name,
      required this.params,
      this.url,
      this.nestedNavTypeName,
      this.isRegular = false,
      this.isNavProtected = false,
      required this.keysModified,
      required this.body});

  @override
  String toString() {
    return 'PStateMethod(name: $name, params: $params, body: $body, isAsync: $isAsync, url: $url, keysModified: $keysModified)';
  }
}

enum MethodStatementKind {
  GeneralStatement,
  IfStatement,
  IfElseStatement,
  ForeachStatement,
  TryStatement,
  MutationStatement,
  ForLoopStatement
}

abstract class StatementResult {
  MethodStatementKind get kind;
}

class GeneralStatementResult extends StatementResult {
  Statement statment;
  GeneralStatementResult({
    required this.statment,
  });
  @override
  MethodStatementKind get kind => MethodStatementKind.GeneralStatement;
}

class MutationStatementResult extends StatementResult {
  final String key;
  final String code;

  MutationStatementResult({required this.key, required this.code});
  @override
  MethodStatementKind get kind => MethodStatementKind.MutationStatement;
}

class ForEachStatementResult extends StatementResult {
  final ExpressionStatement statement;
  final List<StatementResult> statementResults;

  ForEachStatementResult(
      {required this.statement, required this.statementResults});

  @override
  MethodStatementKind get kind => MethodStatementKind.ForeachStatement;
}

class IfStatementResult extends StatementResult {
  final IfStatement statement;
  final List<StatementResult> statementResults;

  IfStatementResult({required this.statement, required this.statementResults});
  @override
  MethodStatementKind get kind => MethodStatementKind.IfStatement;
}

class IfElseStatementResult extends StatementResult {
  final IfStatement statement;
  final List<StatementResult> ifStatementResults;
  final List<StatementResult> elseStatementResults;

  IfElseStatementResult(
      {required this.statement,
      required this.ifStatementResults,
      required this.elseStatementResults});
  @override
  MethodStatementKind get kind => MethodStatementKind.IfElseStatement;
}

class TryStatementResult extends StatementResult {
  final TryStatement statement;
  final List<StatementResult> tryStatementResults;
  final List<List<StatementResult>> catchStatementResults;
  final List<StatementResult> finalStatementResults;

  TryStatementResult(
      {required this.statement,
      required this.tryStatementResults,
      required this.catchStatementResults,
      required this.finalStatementResults});
  @override
  MethodStatementKind get kind => MethodStatementKind.TryStatement;
}

class ForStatementResult extends StatementResult {
  final ForStatement statement;
  final List<StatementResult> statementResults;

  ForStatementResult({required this.statement, required this.statementResults});
  @override
  MethodStatementKind get kind => MethodStatementKind.ForLoopStatement;
}
