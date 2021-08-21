import "dart:io";
import 'dart:math';
import 'dart:typed_data';
import 'package:genericbackend/src/openapispec/openapi_spec.dart';
import "package:shelf_plus/shelf_plus.dart";
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

void main() {
  generateSpec();
  shelfRun(init);
}

Handler init() {
  final list = <String>[
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight"
  ];

  final app = Router().plus;
  // app.use(corsHeaders(headers: overrideHeaders));
  app.get("/", () => "Hello Shelf");
  app.get("/json", () {
    final json = <String, dynamic>{"name": "one", "count": 2};
    print("json $json");
    return json;
  });
  app.get("/octet", () {
    final result = Uint8List.fromList([1, 2]);
    print("Octet Result $result");
    return result;
  });
  app.get("/optimistic-fail", () {
    throw Exception();
  });
  app.get("/pagination/<page>", (Request request) {
    print("Request Url ${request.url}");

    final page = int.parse(request.routeParameter("page"));
    if (page == 1) {
      return {"list": list.getRange(0, 5).toList(), "nextPage": 2};
    }
    return {"list": list.getRange(5, list.length).toList(), "nextPage": null};
  });
  app.post("/jsonpost", (Request request) {
    print("url body ${request.body}");
    return {"name": "one"};
  });
  app.post("/form-upload", (Request request) async {
    print("form-upload request ${await request.body.asJson}");
    return {"name": "one"};
  });
  app.post("/uploadprogress", (Request request) async {
    print("upload progress ${request.body.asBinary}");
    // final stream = request.body.asBinary;
    print("stream ");
    // await stream.forEach((element) {
    //   print("upload progress $element");
    // });
    return {"name": "one"};
  });
  app.get("/offline", () {
    print("offline here");
    return "online";
  });
  app.post("/download", (Request request) {
    return File("simple.txt");
  });
  app.get("/file", () => File("siva.jpeg"));
  app.get("/siva", () => File("siva.jpeg").readAsBytesSync());
  app.get("/stream", () => generateStream());
  return app;
}

Stream<List<int>> generateStream() async* {
  yield [Random().nextInt(5)];
  print("one");
  await Future.delayed(const Duration(milliseconds: 400), () {});
  yield [Random().nextInt(100)];
  await Future.delayed(const Duration(milliseconds: 400), () {});
  print("done stream");
  yield [5];
}
