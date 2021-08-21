import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/errors.dart';
import 'package:dstore_generator/src/pstate/constants.dart';
import 'package:dstore_generator/src/pstate/generator_helper.dart';
import 'package:dstore_generator/src/pstate/nav/nav_generator_helper.dart';
import 'package:dstore_generator/src/pstate/types.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:tuple/tuple.dart';

class PStateAstVisitor extends SimpleAstVisitor<dynamic> {
  List<Field> fields = [];
  List<PStateMethod> methods = [];
  List<Field> psDeps = [];
  final bool isPersitable;
  final ClassElement element;
  final bool historyEnabled;
  final int? historyLimit;
  final bool isNav;
  final List<NestedNavsInfo>? nestedNavs;

  PStateAstVisitor(
      {required this.element,
      required this.isPersitable,
      this.isNav = false,
      this.historyLimit,
      this.nestedNavs,
      required this.historyEnabled}) {
    if (isNav) {
      fields.add(Field(name: "page", type: "Page?", isOptional: true));
      fields.add(
          Field(name: "beforeLeave", type: "BeforeLeaveFn?", isOptional: true));
      fields.add(Field(
          name: "meta",
          type: "NavConfigMeta",
          isOptional: false,
          value: "NavConfigMeta()"));
      fields.add(Field(
        name: "navOptions",
        type: "NavOptions?",
        isOptional: false,
      ));
    }
    if (historyEnabled) {
      fields.add(Field(name: "canUndo", type: "bool", value: "false"));
      fields.add(Field(name: "canRedo", type: "bool", value: "false"));
    }
  }

  @override
  dynamic visitMethodDeclaration(MethodDeclaration node) {
    final name = node.name.name;
    if (isNav) {
      logger.shout("Annot ${node.metadata.firstOrNull?.elementAnnotation}");
    }
    final methodElement = element.methods.singleWhere((me) => me.name == name);
    final regularAnnot = methodElement.annotationFromType(RegularMethod);
    if (regularAnnot != null ||
        (isNav && navStateRegularMethods.contains(name))) {
      logger.shout("buildPages : ${node.toSource()}");
      methods.add(PStateMethod(
          isAsync: false,
          name: name,
          params: [],
          isRegular: true,
          keysModified: [],
          body: node.toSource()));
      return;
    }
    if (node.isGetter || node.isSetter) {
      throw NotAllowedError(
          "getters and setters are not allowed in pstates , remove '${node.name}' from PStste");
    }
    final body = node.body;
    if (body is EmptyFunctionBody) {
      throw Exception("method should contain mutation to fields");
    }
    final rt = node.returnType?.toString();
    logger.shout("RT : $rt");
    var isAsync = false;
    if (node.body.isAsynchronous && (rt != "Future<void>" && rt != "void")) {
      isAsync = true;
      throw InvalidSignatureError(
          "You should annotate method  '${node.name.name}' return type with Future<void>  ");
    } else if (!node.body.isAsynchronous && rt != "void") {
      throw InvalidSignatureError(
          "You should annotate method  '${node.name.name}' return type with void  ");
    }

    final params = AstUtils.convertParamsToFields(node.parameters);

    final paramsStr = _convertMethodParamsToString(params);
    var mbody = "";
    final keys = <String>[];
    String? rawUrl;
    String? finalUrl;
    String? nestedNavTypeName;
    var isNavProtected = false;

    if (isNav) {
      final urlTuple =
          getUrlFromMethod(mparams: params, methodElement: methodElement);
      rawUrl = urlTuple?.rawUrl;
      finalUrl = urlTuple?.finalUrl;
      final protectedAnnot = methodElement.annotationFromType(Protected);
      if (protectedAnnot != null) {
        isNavProtected = true;
      } else {
        isNavProtected = urlTuple?.isProtected ?? false;
      }
      final nestedNavElement = urlTuple?.nestedEleemnt;
      if (nestedNavElement != null &&
          nestedNavElement is ClassElement &&
          nestedNavs != null) {
        final i = isNavPState(nestedNavElement);
        if (i?.startsWith("NestedNavState") != true) {
          throw ArgumentError.value(
              "nestedType param of Url annotation should be a class annotated with PState and  extends NestedNavState ");
        }
        nestedNavTypeName = getFullTypeName(nestedNavElement);
        nestedNavs!.add(NestedNavsInfo(
            typeName: nestedNavTypeName,
            url: rawUrl!,
            defaultAction: "${element.name.substring(2)}Actions.$name()"));
      }
    }
    if (body is ExpressionFunctionBody) {
      final e = body.expression;
      if (e is AssignmentExpression) {
        if (!_isThisPropertyAccessExpression(e.leftHandSide)) {
          throw Exception(
              "Singleline body should be assigment expression of class variable with this. prefix");
        }
        final pa = e.leftHandSide as PropertyAccess;
        keys.add(pa.propertyName.name);
        final fname = pa.toString().split(".")[1];
        mbody = """
           ${paramsStr}
           return ${STATE_VARIABLE}.copyWith(${fname}:${e.rightHandSide.toString().replaceAll("this.", "${STATE_VARIABLE}.")});
        """;
      } else {
        throw Exception(
            "Singleline body should assigment expression of class variable with this.prefix");
      }
    } else if (body is BlockFunctionBody) {
      print("processMethodStatements ${name} isAsync $isAsync ");
      final msr = processMethodStatements(
          statements: body.block.statements,
          historyEnabled: historyEnabled,
          url: finalUrl,
          isAsyncMethod: isAsync,
          isNav: isNav,
          limit: historyLimit);
      final statements = msr.item1;
      keys.addAll(msr.item2);
      mbody = """
           ${paramsStr}
           ${statements}
           """;
    }
    if (node.body is BlockFunctionBody) {
      final ex = node.body as BlockFunctionBody;
      final bodyVisitor = MethodAstVisitor(element: element, isNav: isNav);
      node.body.visitChildren(bodyVisitor);
      ex.block.statements.forEach((statement) {
        print(
            "************** Check ${statement.toString()} ${statement.runtimeType}");
        if (statement is ExpressionStatement) {
          print("exrp");
          print(statement.expression.runtimeType);
          // print(statement.)
        }
        // if(statement is TryStatement) {
        //    statement.
        // }
        // if (statement is ForStatement) {
        //   print(
        //       "forstatement lp ${statement.forLoopParts} body ${statement.body.runtimeType}");
        // }
      });
    }

    methods.add(PStateMethod(
        isAsync: node.body.isAsynchronous,
        name: name,
        url: rawUrl,
        isNavProtected: isNavProtected,
        params: params,
        nestedNavTypeName: nestedNavTypeName,
        keysModified: keys
            .map((e) => fields.singleWhere((element) => element.name == e,
                orElse: () => throw ArgumentError.value(
                    "key $e not found in fields $fields , this can occur if you're using pstate as nav but didnt specified isNav param")))
            .toList(),
        body: mbody));
    return super.visitMethodDeclaration(node);
  }

  @override
  dynamic visitFieldDeclaration(FieldDeclaration node) {
    final typeA = node.fields.type;
    if (typeA == null) {
      throw InvalidSignatureError(
          "Should provide type annotation for fields , specify type for field '${node.fields.variables.first.name}'");
    }
    final type = typeA.toString();
    node.fields.variables.forEach((v) {
      final name = v.name.toString();
      final valueE = v.initializer;
      final fe =
          element.fields.singleWhere((element) => element.name == v.name.name);
      if (v.isLate) {
        // check for psdeps

        print("fe $fe");
        if (!type.startsWith("\$_") ||
            fe.type.element?.annotationFromType(PState) == null) {
          throw NotAllowedError(
              "Only PState models are allowed as late variables");
        }
        final psDepElement = fe.type.element as ClassElement;
        final dt = getFullTypeName(psDepElement);
        if (isNav) {
          // final psState = psDepElement.getPState();
          // if (psState.nav == true && nestedNavs != null) {
          //   nestedNavs!.add(name);
          // }
        }
        psDeps.add(Field(name: name, type: type.substring(2), value: dt));
      } else {
        if (!type.endsWith("?") && valueE == null) {
          logger.shout("Special Field ${node.runtimeType} $node  ");
          throw InvalidSignatureError(
              "Should provide initital value for fields");
        }
        final value = valueE.toString();
        final fe = element.fields.singleWhere((f) => f.name == name);
        logger.shout(
            "Variable Annotations $fe ${fe.metadata} element ${v.declaredElement}");

        var annotations = fe.metadata.map((e) => e.toSource()).toList();
        final noPersitAnnot = fe.annotationFromType(ExcludeThisKeyWhilePersit);
        if (isPersitable && noPersitAnnot != null) {
          if (fe.hasJsonKey) {
            annotations = fe.mergeJsonKeyAndReturnAnnotations(
                <String, dynamic>{"ignore": true});
          } else {
            annotations.add("@JsonKey(ignore: true)");
          }
        }
        if (name == "h") {
          print(
              "nonconst annot ${fe.annotationFromType(PSNonConstClassField)}");
        }
        final nonConstValue =
            fe.annotationFromType(PSNonConstClassField) != null &&
                value != "null";
        print("nonConstValue $name $nonConstValue");
        fields.add(Field(
            name: name,
            annotations: annotations,
            type: type,
            value: value,
            nonConstValue: nonConstValue));
      }
    });
    print(
        "declared element : ${node.fields.type} node : ${node.fields.variables[0]}");
    return super.visitFieldDeclaration(node);
  }

  bool _isPStateModel(VariableDeclaration v) {
    final fe =
        element.fields.singleWhere((element) => element.name == v.name.name);
    print("fe $fe");
    return fe.type.element?.annotationFromType(PState) != null;
  }
}

String _convertMethodParamsToString(List<Field> params) {
  if (params.isEmpty) {
    return "final ${PAYLOAD_VARIBALE} = ${ACTION_VARIABLE}.payload!;";
  }
  final p = params
      .map((p) =>
          "final ${p.name} = ${PAYLOAD_VARIBALE}[\"${p.name}\"] as ${p.type};")
      .join("\n");
  return """
      final ${PAYLOAD_VARIBALE} = ${ACTION_VARIABLE}.payload!;
      ${p}
  """;
}

bool _isThisPropertyAccessExpression(Expression exp) {
  if (exp is PropertyAccess) {
    final a = exp.toString().split(".");
    return a.length == 2 && a[0] == "this";
  } else {
    return false;
  }
}

class ProcessStatementOptions {
  final bool isReturnSupported;

  const ProcessStatementOptions({this.isReturnSupported = false});
}

bool isMutationStatement(AstNode statement) {
  var result = false;
  //  print("*** is")
  if (statement is ExpressionStatement) {
    final exp = statement.expression;
    if (exp is AssignmentExpression) {
      result = _isThisPropertyAccessExpression(exp.leftHandSide);
    }
  }
  return result;
}

bool isForEachStatement(AstNode statement) {
  var result = false;
  if (statement is ExpressionStatement) {
    final exp = statement.expression;
    if (exp is MethodInvocation) {
      result = exp.methodName.toString() == "forEach";
    }
  }
  return result;
}

ForEachStatementResult processForEachStatement(Statement statement) {
  var statementResults = <StatementResult>[];
  final exp = statement as ExpressionStatement;
  final mi = exp.expression as MethodInvocation;
  final fExp = mi.argumentList.arguments[0] as FunctionExpression?;
  if (fExp == null) {
    throw Exception("You should provide argument to forEach");
  }
  final body = fExp.body;
  if (body is ExpressionFunctionBody) {
    statementResults = processStatements([body.expression]);
  } else if (body is BlockFunctionBody) {
    statementResults = processStatements(body.block.statements);
  }
  return ForEachStatementResult(
      statement: statement, statementResults: statementResults);
}

IfStatementResult processIfOnlyStatement(
    Statement statement, ProcessStatementOptions options) {
  final thenStatement = (statement as IfStatement).thenStatement;
  var statementResults = <StatementResult>[];
  if (thenStatement is ExpressionStatement) {
    statementResults = processStatements([thenStatement], options);
  }
  if (thenStatement is Block) {
    statementResults = processStatements(thenStatement.statements, options);
  }
  return IfStatementResult(
      statement: statement, statementResults: statementResults);
}

IfElseStatementResult processIfElseStatement(
    Statement statement, ProcessStatementOptions options) {
  final thenStatement = (statement as IfStatement).thenStatement;
  var ifStatementResults = <StatementResult>[];
  if (thenStatement is ExpressionStatement) {
    ifStatementResults = processStatements([thenStatement]);
  }
  if (thenStatement is Block) {
    ifStatementResults = processStatements(thenStatement.statements);
  }
  var elseStatementResults = <StatementResult>[];
  final elseStatement = statement.elseStatement;
  if (elseStatement is Block) {
    elseStatementResults = processStatements(elseStatement.statements, options);
  } else if (elseStatement is IfStatement &&
      elseStatement.elseStatement == null) {
    elseStatementResults = [processIfOnlyStatement(elseStatement, options)];
  } else if (elseStatement is IfStatement) {
    elseStatementResults = [processIfElseStatement(elseStatement, options)];
  } else {
    elseStatementResults = processStatements([elseStatement!], options);
  }
  return IfElseStatementResult(
      statement: statement,
      ifStatementResults: ifStatementResults,
      elseStatementResults: elseStatementResults);
}

TryStatementResult processTryStatement(
    TryStatement statement, ProcessStatementOptions options) {
  print("Processing try statement $statement");
  final tryStatementResults =
      processStatements(statement.body.statements, options);
  final catchStatementResults = statement.catchClauses
      .map((cc) => processStatements(cc.body.statements, options))
      .toList();
  print("catch done");
  final List<StatementResult> finalStatementResults =
      statement.finallyBlock == null
          ? []
          : processStatements(statement.finallyBlock!.statements, options);
  return TryStatementResult(
      statement: statement,
      tryStatementResults: tryStatementResults,
      catchStatementResults: catchStatementResults,
      finalStatementResults: finalStatementResults);
}

ForStatementResult processForStatement(
    ForStatement statement, ProcessStatementOptions options) {
  late List<StatementResult> statementResults;
  final body = statement.body;
  if (body is Block) {
    statementResults = processStatements(body.statements, options);
  } else {
    statementResults = processStatements([body], options);
  }
  return ForStatementResult(
      statement: statement, statementResults: statementResults);
}

List<StatementResult> processStatements(List<AstNode> statements,
    [ProcessStatementOptions options = const ProcessStatementOptions()]) {
  return statements.map((statement) {
    late StatementResult result;
    if (isMutationStatement(statement)) {
      final exp = ((statement as ExpressionStatement).expression
          as AssignmentExpression);
      final key = exp.leftHandSide.toString().split(".")[1];
      final code =
          """${DSTORE_PREFIX}${key} ${exp.operator} ${exp.rightHandSide.toString().replaceAll("this.", "${STATE_VARIABLE}.")};""";
      result = MutationStatementResult(key: key, code: code);
    } else if (isForEachStatement(statement)) {
      result = processForEachStatement(statement as Statement);
    } else if (statement is IfStatement && statement.elseStatement == null) {
      // ifonly statement
      result = processIfOnlyStatement(statement, options);
    } else if (statement is IfStatement) {
      // if else
      result = processIfElseStatement(statement, options);
    } else if (statement is TryStatement) {
      result = processTryStatement(statement, options);
    } else if (statement is ForStatement) {
      result = processForStatement(statement, options);
    } else if (statement is ReturnStatement && !options.isReturnSupported) {
      throw Exception("Return statement is not supported use if else");
    } else {
      result = GeneralStatementResult(statment: statement as Statement);
    }
    return result;
  }).toList();
}

String replaceThisWithStateText(String input, Iterable<String> keys) {
  var result = input;
  keys.forEach((key) {
    result = result.replaceAll("this.${key}", "${DSTORE_PREFIX}${key}");
  });
  result = result.replaceAll("this.", "${STATE_VARIABLE}.");
  return result;
}

String replaceThisWithState(AstNode node, Iterable<String> keys) {
  return replaceThisWithStateText(node.toString(), keys);
}

String convertIfStatementResultToString(
    IfStatementResult statementResult, Iterable<String> keys) {
  final condition =
      replaceThisWithState(statementResult.statement.condition, keys);
  return """
       if(${condition}) {
         ${convertStatementResultsToString(statementResult.statementResults, keys).join("\n")}
       }
   """;
}

String convertIfElseStatementResultToString(
    IfElseStatementResult iesr, Iterable<String> keys) {
  final ies = iesr.statement;
  final ifCond = replaceThisWithState(ies.condition, keys);
  final ifBody =
      convertStatementResultsToString(iesr.ifStatementResults, keys).join("\n");
  final elseS = ies.elseStatement;
  var else_str = "";
  if (elseS is Block || elseS is ExpressionStatement) {
    else_str = """else {
         ${convertStatementResultsToString(iesr.elseStatementResults, keys).join("\n")}
       }""";
  } else if (elseS is IfStatement && elseS.elseStatement == null) {
    else_str =
        "else ${convertIfStatementResultToString(iesr.elseStatementResults[0] as IfStatementResult, keys)}";
  } else if (elseS is IfStatement) {
    else_str =
        "else ${convertIfElseStatementResultToString(iesr.elseStatementResults[0] as IfElseStatementResult, keys)}";
  }

  return """
    if(${ifCond}) {
      ${ifBody}
    } ${else_str}
  """;
}

String converForEachStatementResultToString(
    ForEachStatementResult fesr, Iterable<String> keys) {
  final mi = fesr.statement.expression as MethodInvocation;

  final fExp = mi.argumentList.arguments[0] as FunctionExpression;
  final params = fExp.parameters!.parameters.map((p) => p.toString()).join(",");
  final call = "${mi.target}.${mi.methodName}";
  final body =
      convertStatementResultsToString(fesr.statementResults, keys).join("\n");
  return """${call}((${params}) {
     ${body}
  }); """;
}

String convertTryStatementResultToString(
    TryStatementResult tsr, Iterable<String> keys) {
  final tb =
      convertStatementResultsToString(tsr.tryStatementResults, keys).join("\n");
  print("tb $tb");
  final cb = tsr.statement.catchClauses.asMap().entries.map((me) {
    final i = me.key;
    final c = me.value;
    final cb =
        convertStatementResultsToString(tsr.catchStatementResults[i], keys)
            .join("\n");
    print(
        "cblock $c ck ${c.catchKeyword} cp ${c.exceptionParameter} sp ${c.stackTraceParameter} ");
    final onException =
        c.exceptionType != null ? "on ${c.exceptionType} " : " ";
    final catchClause = c.catchKeyword != null
        ? "catch(${c.exceptionParameter}${c.stackTraceParameter != null ? ", ${c.stackTraceParameter}" : ""})"
        : "";
    return """${onException} ${catchClause} {
        ${cb}
      }""";
  }).join("\n");
  final fb = tsr.finalStatementResults.isNotEmpty
      ? """ finally {
        ${convertStatementResultsToString(tsr.finalStatementResults, keys).join("\n")}
      }
        """
      : "";
  return """
       try {
          ${tb}
       } ${cb}
        ${fb}
      """;
}

String convertForStatementResultToString(
    ForStatementResult fsr, Iterable<String> keys) {
  final flp = replaceThisWithState(fsr.statement.forLoopParts, keys);
  return """
    for(${flp}) {
      ${convertStatementResultsToString(fsr.statementResults, keys).join("\n")}
    }
  """;
}

List<String> convertStatementResultsToString(
    List<StatementResult> statmentResults, Iterable<String> keys) {
  final result = <String>[];
  statmentResults.forEach((sr) {
    switch (sr.kind) {
      case MethodStatementKind.GeneralStatement:
        final gsr = sr as GeneralStatementResult;
        result.add(replaceThisWithState(gsr.statment, keys));
        break;
      case MethodStatementKind.IfStatement:
        final isr = sr as IfStatementResult;
        result.add(convertIfStatementResultToString(isr, keys));
        break;
      case MethodStatementKind.IfElseStatement:
        final iesr = sr as IfElseStatementResult;
        result.add(convertIfElseStatementResultToString(iesr, keys));
        break;
      case MethodStatementKind.ForeachStatement:
        final fesr = sr as ForEachStatementResult;
        result.add(converForEachStatementResultToString(fesr, keys));
        break;
      case MethodStatementKind.TryStatement:
        final tsr = sr as TryStatementResult;
        result.add(convertTryStatementResultToString(tsr, keys));
        break;
      case MethodStatementKind.MutationStatement:
        final msr = sr as MutationStatementResult;
        result.add(msr.code);
        break;
      case MethodStatementKind.ForLoopStatement:
        final fsr = sr as ForStatementResult;
        result.add(convertForStatementResultToString(fsr, keys));
        break;
    }
  });
  return result;
}

Tuple2<String, Set<String>> processMethodStatements(
    {required List<Statement> statements,
    required bool historyEnabled,
    required bool isAsyncMethod,
    String? url,
    bool isNav = false,
    int? limit}) {
  final statementResults = processStatements(statements);
  print("statementResults ${statementResults}");
  List<MutationStatementResult> getMutationOnlyStatementResults(
      List<StatementResult> statementResults) {
    final result = <MutationStatementResult>[];
    statementResults.forEach((sr) {
      switch (sr.kind) {
        case MethodStatementKind.GeneralStatement:
          break;
        case MethodStatementKind.IfStatement:
          result.addAll(getMutationOnlyStatementResults(
              (sr as IfStatementResult).statementResults));
          break;
        case MethodStatementKind.IfElseStatement:
          final ies = sr as IfElseStatementResult;
          result
              .addAll(getMutationOnlyStatementResults(ies.ifStatementResults));
          result.addAll(
              getMutationOnlyStatementResults(ies.elseStatementResults));
          break;
        case MethodStatementKind.ForeachStatement:
          final fs = sr as ForEachStatementResult;
          result.addAll(getMutationOnlyStatementResults(fs.statementResults));
          break;
        case MethodStatementKind.TryStatement:
          final tsr = sr as TryStatementResult;
          result
              .addAll(getMutationOnlyStatementResults(tsr.tryStatementResults));
          tsr.catchStatementResults.forEach((csr) {
            result.addAll(getMutationOnlyStatementResults(csr));
          });

          result.addAll(
              getMutationOnlyStatementResults(tsr.finalStatementResults));
          break;
        case MethodStatementKind.MutationStatement:
          result.add(sr as MutationStatementResult);
          break;
        case MethodStatementKind.ForLoopStatement:
          final fsr = sr as ForStatementResult;
          result.addAll(getMutationOnlyStatementResults(fsr.statementResults));
          break;
      }
    });
    return result;
  }

  final mutationStatements = getMutationOnlyStatementResults(statementResults);
  print("isAsyncMethod $isAsyncMethod");
  if (!isAsyncMethod && mutationStatements.isEmpty) {
    throw Exception(
        "There should be atleast one assignemtn operation for class fields");
  }
  final keys = mutationStatements.map((e) => e.key).toSet();
  final specialKeys = <String>[];
  final statementsStr =
      convertStatementResultsToString(statementResults, keys).join("\n");
  print("hellokeys $keys");
  if (isNav) {
    //  _DStoreState.meta
    if (!keys.contains("meta") &&
        !statementsStr.contains("${STATE_VARIABLE}.meta")) {
      specialKeys.add("meta: NavConfigMeta()");
    }
  }
  // if (historyEnabled) {
  //   specialKeys.add("canUndo: ${STATE_VARIABLE}.dontTouchMePSHistory.canUndo");
  //   specialKeys.add("canRedo: ${STATE_VARIABLE}.dontTouchMePSHistory.canRedo");
  // }
  final spl = specialKeys.isEmpty ? "" : ",${specialKeys.join(",")}";
  final stataments = """
    ${keys.map((k) => "var ${DSTORE_PREFIX}${k} = ${STATE_VARIABLE}.${k};").join("\n")}
    ${statementsStr}
    ${(historyEnabled || url != null || isNav) ? """
    var newState = ${STATE_VARIABLE}.copyWith(${keys.map((k) => "${k} : ${DSTORE_PREFIX}${k}").join(",")}$spl);
    ${historyEnabled ? """ 
     newState.dontTouchMePSHistory = ${STATE_VARIABLE}.dontTouchMePSHistory;
     final keys = ${PAYLOAD_VARIBALE}["${PSHISTORY_KEYS_MODIFIED_KEY}"] as List<String>;
     final map = newState.toMap();
     map.removeWhere((key, dynamic value) => !keys.contains(key));
     newState.dontTouchMePSHistory.internalAdd(map);
     newState = newState.copyWith(canUndo: newState.dontTouchMePSHistory.canUndo,canRedo: newState.dontTouchMePSHistory.canRedo);
    """ : ""}
    ${isNav ? """ 
    newState.dontTouchMe = ${STATE_VARIABLE}.dontTouchMe;
    ${url != null ? " newState.dontTouchMe.url = '$url';" : "newState.dontTouchMe.url = null;"}
    """ : ""}
    return newState;
    """ : "return ${STATE_VARIABLE}.copyWith(${keys.map((k) => "${k} : ${DSTORE_PREFIX}${k}").join(",")});"}
    
  """;
  return Tuple2(stataments, keys);
}

class MethodAstVisitor extends RecursiveAstVisitor<dynamic> {
  final ClassElement element;
  final bool isNav;
  final List<String> allowedClassMembers = [];
  final List<String> allowedMethods = [];
  final List<String> notAllowedClassMembers = [];

  MethodAstVisitor({required this.element, required this.isNav}) {
    if (isNav) {
      allowedClassMembers.addAll(navStateFeilds);
    }
    allowedClassMembers.addAll(element.fields.map((e) => e.name));
    allowedClassMembers.addAll(element.methods
        .where((m) => m.annotationFromType(RegularMethod) != null)
        .map((e) => e.name));
    // allowedMethods.addAll(element.methods
    //     .where((m) => m.annotationFromType(RegularMethod) != null)
    //     .map((e) => e.name));
    print("allowedClassMembers $allowedClassMembers");
    notAllowedClassMembers.addAll(element.methods
        .where((m) => m.annotationFromType(RegularMethod) == null)
        .map((e) => e.name));
    print("notAllowedClassMembers $notAllowedClassMembers");
  }

  @override
  dynamic visitSimpleIdentifier(SimpleIdentifier node) {
    final name = node.name;
    print(
        "visitSimpleIdentifier $name , Parent ${node.parent}  runtime type ${node.parent.runtimeType} ${node.parent?.toString().startsWith("this.")} , ${node.parent.runtimeType} pe ${node.staticParameterElement} se ${node.staticElement} st ${node.staticType} , ");
    // node.parent?.childEntities.forEach((element) {
    //   print("parent : ce ${element} ${element.runtimeType}");
    // });

    if (allowedClassMembers.contains(name)) {
      print("its allowed class memeber");
      final error =
          "You should access class memeber ${name} with this. prefix , example : this.${name} , if $name is not a class memeber probably you're shadowing variable if thats the case please use different name for your local variable";
      if (node.parent == null ||
          node.parent!.childEntities.firstOrNull.toString() == name) {
        throw NotAllowedError(error);
      }
    }
    if ((allowedClassMembers.contains(name) && node.parent == null) ||
        (allowedClassMembers.contains(name) &&
            node.parent?.toString().startsWith("this.") != true)) {
      print(element.fields.map((e) => e.name));
    }

    if (notAllowedClassMembers.contains(name) &&
        (node.parent == null ||
            node.parent?.toString().startsWith("this.") == true)) {
      throw NotAllowedError(
          "You shouldnt call action method with name '${name}' inside any other method, if you want to reuse logic use methods with @RegularMethod() annotation ");
    }
    return super.visitSimpleIdentifier(node);
  }
}
