import 'package:meta/meta.dart';
import '../error.dart';

@immutable
class WrappedString {
  const WrappedString();
}

class WrappedStringError extends AppError {
  WrappedStringError(cause) : super(cause);
}
