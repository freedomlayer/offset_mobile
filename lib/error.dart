/// Base error class for this application
abstract class AppError implements Exception {
  String cause;
  AppError(this.cause);

  @override
  String toString() {
    return 'Exception($cause)';
  }
}
