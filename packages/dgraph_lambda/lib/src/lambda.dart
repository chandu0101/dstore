@JS()
library dgraph_lambda;

import 'package:js/js.dart';
import 'package:js/js_util.dart';

@anonymous
@JS()
abstract class GraphQLResponse<R /* R should be JSObject  */ > {
  external R /*Record<Stringdynamic>*/ get data;
  external set data(dynamic /*Record<Stringdynamic>*/ v);
  external List<dynamic /*{ message: string }*/ > get errors;
  external set errors(List<dynamic /*{ message: string }*/ > v);
  external factory GraphQLResponse(
      {dynamic /*Record<Stringdynamic>*/ data,
      List<dynamic /*{ message: string }*/ > errors});
}

@anonymous
@JS()
abstract class GraphQLEventWithParent<P /* it should be JSObject */,
    A /* it should be JSObject */ > {
  external P? get parent;
  external set parent(P? v);
  external A /*JS Object*/ get args;
  external set args(A v);

  external GraphQLEventWithParentDQL get dql;
}

@JS()
@anonymous
abstract class GraphQLEventWithParentDQL {}

@JS()
@anonymous
abstract class _GraphQLEventWithParentDQL {
  external Promise<GraphQLResponse> query(
      String s, dynamic vars /*Record<string, any> | undefined*/);
  external Promise<GraphQLResponse> mutate(String s);
}

extension GraphQLEventWithParentDQLExt on GraphQLEventWithParentDQL {
  Future<GraphQLResponse<R>> query<R, V>(
      String s, V? vars /* It should be a JS Object*/) {
    Object t = this;
    final tt = t as _GraphQLEventWithParentDQL;
    return promiseToFuture(tt.query(s, vars));
  }

  Future<GraphQLResponse<R>> mutate<R>(String s) {
    Object t = this;
    final tt = t as _GraphQLEventWithParentDQL;
    return promiseToFuture(tt.mutate(s));
  }
}

@JS()
abstract class Promise<T> {}

@JS()
@anonymous
abstract class _GraphQLEventWithParent {
  external Promise<GraphQLResponse> Function(
      String, dynamic /*Record<Stringdynamic>|dynamic*/) get graphql;
}

extension GraphQLEventWithParentExt on GraphQLEventWithParent {
  Future<GraphQLResponse<R>> graphql<R, V>(String query,
      [V? vars /*it hsould be a JSObject */]) {
    Object t = this;
    final tt = t as _GraphQLEventWithParent;
    return promiseToFuture(tt.graphql(query, vars));
  }
}

typedef ResolverEntryFn<P, A> = dynamic Function(
    GraphQLEventWithParent<P, A> e);
@JS()
external void addGraphQLResolvers(
    dynamic /*JSMap of <String,dynamic Function(GraphQLEventWithParent)>*/ resolvers);
