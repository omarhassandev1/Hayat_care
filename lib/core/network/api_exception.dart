/// Thrown by the data layer when the backend returns an error response
/// (non-2xx status code or success:false) or a network error occurs.
class ServerException implements Exception {
  /// Human-readable message from the backend `message` field,
  /// or a generic network error message.
  final String message;

  /// Optional validation/detail errors from the backend `errors[]` field.
  final List<String> errors;

  const ServerException({
    required this.message,
    this.errors = const [],
  });

  @override
  String toString() => 'ServerException: $message (errors: $errors)';
}
