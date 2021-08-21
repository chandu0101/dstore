class InvalidSignatureError extends Error {
  final String message;

  InvalidSignatureError(this.message);

  @override
  String toString() => 'InvalidSignatureError(message: $message)';
}

class NotAllowedError extends Error {
  final String message;

  NotAllowedError(this.message);

  @override
  String toString() => 'NotAllowedError(message: $message)';
}
