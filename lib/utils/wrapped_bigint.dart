import 'package:meta/meta.dart';

import '../error.dart';

class WrappedBigIntError extends AppError {
  WrappedBigIntError(cause): super(cause);
}

@immutable
class WrappedBigInt {
  const WrappedBigInt();
}
