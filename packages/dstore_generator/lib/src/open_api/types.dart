class InputType {
  final String type;
  final bool required;
  final String contentType;
  final String serializer;

  final String deserializer;

  InputType(
      {required this.type,
      required this.serializer,
      required this.deserializer,
      required this.required,
      required this.contentType});
}

class OutputType {
  final String successType;
  final String errorType;
  final String serializer;
  final String responseType;
  final String errorSerializer;
  final String deserializer;
  final String errorDeserializer;

  OutputType({
    required this.successType,
    required this.errorType,
    required this.serializer,
    required this.deserializer,
    required this.responseType,
    required this.errorSerializer,
    required this.errorDeserializer,
  });
}
