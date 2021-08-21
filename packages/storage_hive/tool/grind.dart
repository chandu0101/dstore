import 'package:grinder/grinder.dart';

void main(List<String> args) => grind(args);

@Task()
void test() => TestRunner().testAsync();

@DefaultTask()
@Depends(test)
void build() {
  Pub.build();
}

@Task()
void gen() {
  Pub.runAsync("build_runner",
      arguments: ["watch", "--delete-conflicting-outputs"]);
}

@Task()
void clean() => defaultClean();
