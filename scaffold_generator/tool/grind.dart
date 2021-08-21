import 'package:grinder/grinder.dart';

import 'platform_files_generator.dart';
import 'template_source_generator.dart';

void main(List<String> args) => grind(args);

@Task()
void test() => new TestRunner().testAsync();

@Task()
void gen() async {
  try {
    await PlatFormFilesGenerator.generate();
    await TemplateSourceGenerator.generate();
  } catch (e, st) {
    print("Error in generating sources $e");
    print(st);
  }
}

@DefaultTask()
@Depends(test)
@Depends(gen)
void build() {
  run("flutter", arguments: ["build", "web"]);
}

@Task()
void clean() => defaultClean();
