import 'package:flutter/material.dart';
import "package:dio/dio.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: "dstore_open_api",
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 100,
        ),
        ElevatedButton(
            onPressed: () async {
              try {
                final dio = Dio();
                final resp = await dio
                    .get<dynamic>("http://localhost:8080/siva",
                        onReceiveProgress: (count, total) {
                  // print("Count $count $total");
                },
                        options: Options(
                            headers: <String, String>{},
                            responseType: ResponseType.bytes));
                print("Response : ${resp.data}");
              } catch (e) {
                print(e);
              }
            },
            child: Text("Download")),
        SizedBox(
          height: 100,
        ),
        ElevatedButton(
            onPressed: () async {
              try {
                final dio = Dio();
                print("Getting stream2");
                final resp = await dio.request<dynamic>(
                    "http://localhost:8080/stream",
                    options: Options(
                        method: "GET",
                        contentType: "application/octet-stream",
                        headers: <String, String>{},
                        responseType: ResponseType.stream));

                print(
                    "Response : runtime type : ${resp.runtimeType} resp data runtime type ${resp.data.runtimeType} Data :  ${resp.data} {}");
              } catch (e) {
                print(e);
              }
            },
            child: Text("Stream Response"))
      ],
    );
  }
}
