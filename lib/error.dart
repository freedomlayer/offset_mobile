// TODO: Possibly rename to AppException?
// See: https://stackoverflow.com/questions/17315945/error-vs-exception-in-dart 

/// Base error class for this application
abstract class AppError implements Exception {
  String cause;
  AppError(this.cause);

  @override
  String toString() {
    return 'Exception($cause)';
  }
}
