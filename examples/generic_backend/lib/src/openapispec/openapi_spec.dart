import 'dart:convert';
import 'dart:io';

import 'package:open_api_schema/v3.dart';

abstract class ContentTypes {
  static const appJson = "application/json";
  static const textHtml = "text/html";
  static const appOctetStream = "application/octet-stream";
}

final defaultResponse = ResponseOrReference(Response(content: {
  "${ContentTypes.textHtml}":
      MediaType(schema: SchemaOrReference(Schema(type: "string")))
}));

final stringSchema = SchemaOrReference(Schema(type: "string"));
final listString =
    SchemaOrReference(Schema(type: "array", items: stringSchema));
final stringBinarySchema =
    SchemaOrReference(Schema(type: "string", format: "binary"));
final intSchmea = SchemaOrReference(Schema(type: "integer"));

final jsonPostSchema = SchemaOrReference(
    Schema(type: "object", properties: {"name": stringSchema}));
void generateSpec() {
  final spec = OpenApiSchema(
      info: Info(title: "", version: ""),
      servers: [Server(url: "http://localhost:8080")],
      openapi: "3.0.0",
      paths: {
        "/": PathItem(
            get: Operation(operationId: "helloPing", responses: {
          "200": ResponseOrReference(Response(
            content: {
              "${ContentTypes.textHtml}":
                  MediaType(schema: SchemaOrReference(Schema(type: "string")))
            },
          )),
          "default": defaultResponse
        })),
        "/json": PathItem(
            get: Operation(operationId: "helloJson", responses: {
          "200": ResponseOrReference(Response(
            content: {
              "${ContentTypes.appJson}": MediaType(
                  schema: SchemaOrReference(Schema(
                      type: "object",
                      required: ["name", "count"],
                      properties: {"name": stringSchema, "count": intSchmea})))
            },
          )),
          "default": defaultResponse
        })),
        "/octet": PathItem(
            get: Operation(operationId: "HelloOctet", responses: {
          "200": ResponseOrReference(Response(
            content: {
              "${ContentTypes.appOctetStream}":
                  MediaType(schema: stringBinarySchema)
            },
          )),
          "default": defaultResponse
        })),
        "/optimistic-fail": PathItem(
            get: Operation(operationId: "OptimisticFail", responses: {
          "200": ResponseOrReference(Response(
            content: {
              "${ContentTypes.textHtml}": MediaType(schema: stringSchema)
            },
          )),
          "default": defaultResponse
        })),
        "/pagination/{page}": PathItem(
            get: Operation(operationId: "Pagination", parameters: [
          ParamOrRef(Parameter(name: "page", o_in: "path", schema: intSchmea)),
          ParamOrRef(
            Parameter(name: "qp", o_in: "query", schema: stringSchema),
          )
        ], responses: {
          "200": ResponseOrReference(Response(
            content: {
              "${ContentTypes.appJson}": MediaType(
                  schema: SchemaOrReference(Schema(type: "object", required: [
                "list",
              ], properties: {
                "list": listString,
                "nextPage": intSchmea
              })))
            },
          )),
          "default": defaultResponse
        })),
        "/jsonpost": PathItem(
            post: Operation(
                operationId: "JsonPost",
                requestBody: RequestBodyOrReference(RequestBody(content: {
                  "${ContentTypes.appJson}": MediaType(schema: jsonPostSchema)
                })),
                responses: {
              "200": ResponseOrReference(Response(
                content: {
                  "${ContentTypes.appJson}": MediaType(schema: jsonPostSchema)
                },
              )),
              "default": defaultResponse
            })),
        "/form-upload": PathItem(
            post: Operation(
                operationId: "FormUpload",
                requestBody: RequestBodyOrReference(RequestBody(content: {
                  "${ContentTypes.appJson}": MediaType(
                      schema:
                          SchemaOrReference(Schema(type: "object", properties: {
                    "file": SchemaOrReference(
                        Schema(type: "string", format: "binary")),
                    "name": stringSchema
                  })))
                })),
                responses: {
              "200": ResponseOrReference(Response(
                content: {
                  "${ContentTypes.appJson}": MediaType(schema: jsonPostSchema)
                },
              )),
              "default": defaultResponse
            })),
        "/uploadprogress": PathItem(
            post: Operation(
                operationId: "UploadProgress",
                requestBody: RequestBodyOrReference(RequestBody(content: {
                  "${ContentTypes.appOctetStream}": MediaType(
                      schema: SchemaOrReference(
                          Schema(type: "string", format: "binary")))
                })),
                responses: {
              "200": ResponseOrReference(Response(
                content: {
                  "${ContentTypes.appJson}": MediaType(schema: jsonPostSchema)
                },
              )),
              "default": defaultResponse
            })),
        "/download": PathItem(
            post: Operation(operationId: "DownloadProgress", responses: {
          "200": ResponseOrReference(Response(
            content: {
              "${ContentTypes.appOctetStream}":
                  MediaType(schema: stringBinarySchema)
            },
          )),
          "default": defaultResponse
        })),
        "/offline": PathItem(
            get: Operation(operationId: "OfflineOp", responses: {
          "200": ResponseOrReference(Response(
            content: {
              "${ContentTypes.textHtml}": MediaType(schema: stringSchema)
            },
          )),
          "default": defaultResponse
        }))
      });

  File("./spec.json").writeAsStringSync(jsonEncode(spec.toJson()));
  print("successfully generated spec");
}
