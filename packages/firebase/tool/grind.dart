import 'package:grinder/grinder.dart';

void main(List<String> args) => grind(args);

@Task()
void gen() {
  Pub.runAsync("build_runner",
      arguments: ["watch", "--delete-conflicting-outputs"]);
}
