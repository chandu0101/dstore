import 'package:dstore/dstore.dart';

import 'local.dart';

@GraphqlOps(api)
class _HelloDSL {
  final todo = Query()
    ..hello(alias: "h1o")
    ..hello1
    ..todo(Todo()..text)
    ..todo(Todo())
    ..input2(Todo()..text, i2: Input1(name: "n2", counts: [3]))
    ..inputArgsQ(
        nameR: "namR",
        idsN: [],
        idsN2: [],
        eR: Enum1.HIGH,
        input1: Input1(name: "i2"))
    ..users(Person()
      ..name
      ..tags
      ..hello(HelloU()..unionfrag_Hello1(Hello1()..name)));

  final s = Query()
    ..todo(Todo()..text)
    ..inputArgsQ(
        nameR: "n22",
        idsN: [],
        count: 3,
        percent: 3.5,
        counts: [4],
        idsN2: [],
        eR: "\$erV" as Enum1,
        input1: Input1(
            name: "input1",
            count: 3,
            counts: [2],
            enum_$d: Enum1.HIGH,
            enums: [Enum1.LOW],
            inputs: [
              Input1(name: "input2", counts: [4])
            ]));
}

final s = "";
