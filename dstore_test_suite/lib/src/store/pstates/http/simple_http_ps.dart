import 'package:dstore/dstore.dart';
import 'package:dstore_test_suite/src/store/api/graphql/ops/local_ops.dart';
import 'package:dstore_test_suite/src/store/api/openapi/local.dart';
part 'simple_http_ps.ps.dstore.dart';

@PState()
class $_SimpleHttp {
  helloPing ping = helloPing();
  helloJson json = helloJson();
  HelloOctet octet = HelloOctet();
  OptimisticFail optFail = OptimisticFail();
  @HttpRequestExtension(transformer: pingTransform)
  helloJsonTransform<int> pinInt = helloJsonTransform();
  @HttpRequestExtension(
      transformer: paginationTransformer, persitDataBetweenFetches: true)
  Pagination pagination = Pagination();

  JsonPost jsPost = JsonPost();

  FormUpload fromUpload = FormUpload();

  UploadProgress uploadProgress = UploadProgress();

  DownloadProgress downloadProgress = DownloadProgress();

  OfflineOp offlineOp = OfflineOp();

  LocalGraphqlOps_ping pingGraphql = LocalGraphqlOps_ping();

  LocalGraphqlOps_users grpahqlUsers = LocalGraphqlOps_users();

  LocalGraphqlOps_chnageNameWithVariables graphqlChangeVariable =
      LocalGraphqlOps_chnageNameWithVariables();

  LocalGraphqlOps_errorQ graphqlError = LocalGraphqlOps_errorQ();

  LocalGraphqlOps_addMessage graphqlAddMessage = LocalGraphqlOps_addMessage();
}

helloJsonTransform<int> pingTransform(
    helloJsonTransform<int> input, helloJsonResponse? responseFromServer) {
  if (responseFromServer == null) {
    return input;
  }
  return input.copyWith(data: responseFromServer.count);
}

Pagination paginationTransformer(Pagination input, PaginationResponse? pr) {
  print("paginationTransformer called $input $pr");
  if (pr == null) {
    return input;
  }
  final oldData = input.data?.list;
  var newList = pr.list;
  var result = input;
  if (oldData != null) {
    result = result.copyWith(
        data: PaginationResponse(
            list: [...oldData, ...newList], nextPage: pr.nextPage));
  } else {
    result = result.copyWith(data: pr);
  }
  return result;
}
