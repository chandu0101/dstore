import 'dart:io';
import "package:dotenv/dotenv.dart" show Parser;
import 'package:dstore_generator/src/utils/utils.dart';

const DSTORE_ENVFILE = "DSTORE_ENVFILE";

abstract class EnvGenerator {
  static bool isGenerated = false;
  static void generate({String dotEnvFilePath = ".env"}) {
    if (!isGenerated) {
      print("generating env file");
      try {
        final systemEnvVars = Map.fromEntries(Platform.environment.entries
            .where(
                (e) => e.key.startsWith("DSTORE_") && e.key != DSTORE_ENVFILE)
            .map((e) => MapEntry(e.key.replaceFirst("DSTORE_", ""), e.value)));

        var fileVars = <String, String>{};
        final envFileFromSystem = Platform.environment[DSTORE_ENVFILE];
        if (envFileFromSystem != null) {
          dotEnvFilePath = envFileFromSystem;
        }
        final file = File(dotEnvFilePath);
        if (file.existsSync()) {
          final lines = file.readAsLinesSync();
          fileVars = Parser().parse(lines);
        }
        final envVars = {
          ...fileVars,
          ...systemEnvVars
        }; // system vars should take high priority
        if (envVars.isNotEmpty) {
          final fields = envVars.entries
              .map((e) => 'static const ${e.key} =  ${e.value} ;')
              .join("\n");
          final content = """"
           // File is automatically generrated on ${DateTime.now().toIso8601String()} , dont modify it directly
           abstarct class Env {
               $fields 
           }
         """;
          File("./lib/env.dart").writeAsStringSync(content);
        }
      } catch (e, st) {
        logger.error("Error while generating env file ", e, st);
        rethrow;
      } finally {
        isGenerated = true;
      }
    }
  }
}
