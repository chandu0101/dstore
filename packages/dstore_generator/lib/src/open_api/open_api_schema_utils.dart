import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:open_api_schema/v3.dart';
import 'package:yaml/yaml.dart';

abstract class OpenApiSchemaUtils {
  static Future<OpenApiSchema> getOpenApiSchema(OpenApi meta) {
    if (meta.http != null) {
      return _getSchemaFromHttp(meta.http!);
    } else {
      return _getSchemaFromFile(meta.file!);
    }
  }

  static Future<OpenApiSchema> _getSchemaFromHttp(
      OpenApiHttpConfig config) async {
    late OpenApiSchema schema;
    try {
      final url = config.url;
      final headers = config.headers;
      final dio = Dio();
      final resp =
          await dio.get<String>(url, options: Options(headers: headers));
      if (resp.data != null) {
        if (url.endsWith(".yaml") || url.endsWith(".yml")) {
          schema = await _getSchemaFromContent(resp.data!, "yaml");
        } else if (url.endsWith(".json")) {
          schema = _getSchemaFromContent(resp.data!, "json");
        }
        if (config.saveOnlineSpecToFile != null) {
          await File(config.saveOnlineSpecToFile!).writeAsString(resp.data!);
        }
      } else {
        throw Exception("Failed to get openapi spec from ");
      }
    } catch (e) {
      if (config.saveOnlineSpecToFile != null) {
        print(
            "Error getting schema from api $e , trying to get from local file");
        schema = await _getSchemaFromFile(config.saveOnlineSpecToFile!);
      }
    }
    return schema;
  }

  static Future<OpenApiSchema> _getSchemaFromFile(String file) async {
    final content = await File(file).readAsString();
    return _getSchemaFromContent(
        content, file.endsWith(".json") ? "json" : "yaml");
  }

  static OpenApiSchema _getSchemaFromContent(String content, String type) {
    Map<String, dynamic> map;
    if (type == "json") {
      map = jsonDecode(content) as Map<String, dynamic>;
    } else {
      final v = (loadYaml(content) as YamlMap).value;
      print(v.runtimeType);
      final dynamic yaml = loadYaml(content);
      String yamlStr;
      try {
        yamlStr = jsonEncode(yaml);
      } catch (e) {
        throw Exception(
            "there is problem in reading yaml file using yaml package, please provide you open api spec as json file. you can convert your yaml file to json using services like https://onlineyamltools.com/convert-yaml-to-json ");
      }
      map = jsonDecode(yamlStr) as Map<String, dynamic>;
    }
    return OpenApiSchema.fromJson(map);
  }
}
