import 'dart:convert';
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:github_actions_yaml/dstore_cicd.dart';
import 'package:scaffold_generator/js_libs/js_core.dart';
import 'package:scaffold_generator/main.dart';
import 'package:scaffold_generator/my_app.dart';
import 'package:scaffold_generator/platforms_source.dart';
import 'package:scaffold_generator/template_sources.dart';

abstract class Generator {
  static Future<dynamic> generateTemplate(
      {required FileSystemDirectoryHandle dirHandle,
      required TemplatesEnum template,
      required CICDEnum cicd,
      required String name,
      required List<String> platformsSelected,
      required List<String> githubWorkFlows}) async {
    final t = describeEnum(template);
    final rootDir =
        await dirHandle.getDirectoryHandle(name, HandleOptions(create: true));
    await writeProjectSources(rootDir, platformsSelected);
    await writeTemplateSources(dirHandle, t);
    if (cicd == CICDEnum.github) {
      final files = <String, String>{};
      githubWorkFlows.forEach((element) {
        final name = element;
        var content = "";
        if (name == "test") {
          content = DStoreCICD.testYaml(
            name,
          );
        } else if (name == "ghpages") {
          content = DStoreCICD.deployToGithubPagesWebYaml(name);
        }
        files["$name.yaml"] = content;
      });
      final folder = {
        "name": ".github",
        "files": {},
        "subfolders": [
          {"name": "workflows", "files": files, "subfolders": []}
        ]
      };
      await saveFolder(folder, rootDir);
    }
  }

  static Future<void> writeTemplateSources(
      FileSystemDirectoryHandle dirHandle, String name) async {
    final t = templateSourcesMap[name]!;
    await saveFolder(t, dirHandle);
  }

  static Future<void> writeProjectSources(FileSystemDirectoryHandle dirHandle,
      List<String> platformSelected) async {
    await Future.wait(platformsSourceCode.entries
        .where((element) => platformSelected.contains(element.key))
        .map((me) async {
      await saveFolder(me.value, dirHandle);
    }));
  }

  static Future<void> saveFolder(
      Map<String, dynamic> folder, FileSystemDirectoryHandle dirHandle) async {
    final name = folder["name"] as String;
    final files = (folder["files"] as Map)
        .map((key, value) => MapEntry(key as String, value as String));
    final subfolders = (folder["subfolders"] as List<dynamic>)
        .map((sf) => sf as Map<String, dynamic>);

    final dir =
        await dirHandle.getDirectoryHandle(name, HandleOptions(create: true));
    await Future.wait(files.entries.map((e) async {
      final data = base64Decode(e.value);
      await dir.writeToFile(e.key, data);
    }));

    await Future.wait(subfolders.map((e) async {
      await saveFolder(e, dir);
    }));
  }

  static Future<void> saveFiles(FileSystemDirectoryHandle dirHandle) async {
    final a1 = await rootBundle.loadString("android/settings.gradle");

    await dirHandle.writeToFile("a1", a1);
  }
}
