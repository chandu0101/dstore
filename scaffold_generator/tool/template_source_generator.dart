import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'platform_files_generator.dart';

abstract class TemplateSourceGenerator {
  static Future<void> generate() async {
    final map = <String, Map<String, dynamic>>{};
    final templates = ["basic"];
    await Future.wait(templates.map((e) async {
      map[e] = (await getTempateSource(e)).toJson();
    }));
    final result = """
  
          final Map<String, Map<String, dynamic>> templateSourcesMap = ${jsonEncode(map)};
        
    """;
    await File("./lib/template_sources.dart").writeAsString(result);
  }

  static Future<DirectoryAndFiels> getTempateSource(String name) async {
    name = "../../dstore_templates/$name";
    final result = <String, String>{};
    await Future.wait(_commonFiles.map((e) async {
      final file = File("./$name/$e");
      if (file.existsSync()) {
        final c = await file.readAsBytes();
        result[e] = base64Encode(c);
      }
    }));
    final foldersToInclude = ["lib", "tool", "test"];
    final subfolders =
        await Future.wait<DirectoryAndFiels>(foldersToInclude.map((e) async {
      final dir = Directory("./$name/$e");
      return await PlatFormFilesGenerator.getDirectoryFiles(dir);
    }));

    return DirectoryAndFiels(name: name, files: result, subfolders: subfolders);
  }

  static final _commonFiles = [
    "pubspec.yaml",
    "README.md",
    "analysis_options.yaml",
    ".gitginore",
    ".metadata",
    ".basic.iml"
  ];
}
