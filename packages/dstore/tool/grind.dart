import 'package:grinder/grinder.dart';

void main(List<String> args) => grind(args);

@Task()
dynamic test() => TestRunner().testAsync();

@DefaultTask()
@Depends(test)
dynamic build() {
  Pub.build();
}

@Task()
dynamic clean() => defaultClean();

@Task()
void gen() {
  Pub.runAsync("build_runner",
      arguments: ["watch", "--delete-conflicting-outputs"]);
}
