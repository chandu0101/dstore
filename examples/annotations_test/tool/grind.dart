import 'package:grinder/grinder.dart';

main(args) => grind(args);

@Task()
void gen() {
  Pub.runAsync("build_runner", arguments: [
    "watch",
    "--delete-conflicting-outputs",
    "--enable-experiment=nonfunction-type-aliases"
  ]);
}

@Task()
void clean() {
  Pub.run("build_runner", arguments: ["clean"]);
}
