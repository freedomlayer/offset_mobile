import '../../error.dart';
import '../../protocol/protocol.dart';

class AmountError extends AppError {
  AmountError(cause) : super(cause);
}

// Amount of decimal places to keep after the decimal point:
const int ACCURACY = 5;

/// Remove all leading zeroes from a string, representing an integer
/// Examples:
/// 00001234  -> 1234
/// 00001     -> 1
/// 00000     -> 0
String stripLeadingZeroes(String numStr) {
  var firstNonzero = numStr.length;
  for (var i = 0; i < numStr.length; ++i) {
    if (numStr[i] != '0') {
      firstNonzero = i;
      break;
    }
  }

  return firstNonzero == numStr.length ? '0' : numStr.substring(firstNonzero);
}

/// Reverse a string. See: https://stackoverflow.com/a/21613700  
String _reverseString(String s) => s.split('').reversed.join();

/// Remove all trailing zeroes from a string, representing an integer
/// Examples:
/// 12340000  -> 1234
/// 10000     -> 1
/// 00000     -> 0
String stripTrailingZeroes(String numStr) {
  return _reverseString(stripLeadingZeroes(_reverseString(numStr)));
}

/// Convert U128 amount, divided by 10^ACCURACY, to a string with a decimal point.
String amountToString(U128 amount) {
  final amountStr = amount.inner.toString();

  final resStr = amountStr.length <= ACCURACY
      ? '0.' + ('0' * (ACCURACY - amountStr.length)) + amountStr
      : amountStr.substring(0, amountStr.length - ACCURACY) +
        '.' +
        amountStr.substring(amountStr.length - ACCURACY);

  final splitted = resStr.split('.');
  assert(splitted.length == 2);
  final beforePoint = stripLeadingZeroes(splitted[0]);
  final afterPoint = stripTrailingZeroes(splitted[1]);

  if (beforePoint.isEmpty || beforePoint == '0') {
    if (afterPoint.isEmpty || afterPoint == '0') {
      return '0';
    } else {
      return '0.' + afterPoint;
    }
  } else {
    if (afterPoint.isEmpty || afterPoint == '0') {
      return beforePoint;
    } else {
      return beforePoint + '.' + afterPoint;
    }
  }

}

// See: https://stackoverflow.com/a/25886695
bool _isDigit(String s, int idx) => (s.codeUnitAt(idx) ^ 0x30) <= 9;

bool _isAllDigits(String s) {
  for (var i = 0; i < s.length; ++i) {
    if (!_isDigit(s, i)) {
      return false;
    }
  }
  return true;
}

bool verifyAmountString(String amountString) {
  final splitted = amountString.split('.');
  switch (splitted.length) {
    case 0:
      {
        throw AssertionError('Should never reach here');
      }
      break;
    case 1:
      {
        // We have no decimal point.
        // Make sure that we only have digits left:
        return _isAllDigits(splitted[0]);
      }
      break;
    case 2:
      {
        return _isAllDigits(splitted[0]) &&
            _isAllDigits(splitted[1]) &&
            splitted[1].length <= ACCURACY;
      }
      break;
    default:
      {
        return false;
      }
      break;
  }
}


/// Remove leading zeroes, make sure that there is a decimal point, and that
/// there are `ACCURACY` digits after the decimal point.
/// Examples:
/// 1234.5  -> 1234.50000
/// 12      -> 12.00000
/// 000012  -> 12.00000
String _canonicalizeAmountString(String amountString) {
  // Find decimal point.
  final pointIndex = amountString.indexOf('.');
  assert(amountString.length - pointIndex - 1 <= ACCURACY);

  // Find decimal point or add one ourselves.
  // Make sure that we have exactly `ACCURACY` decimal digits after the decimal point:
  final String pointStr = pointIndex < 0
      ? amountString + '.' + '0' * ACCURACY
      : amountString + '0' * (ACCURACY - (amountString.length - pointIndex - 1));

  // Split to two parts: Before and after point:
  final splitted = pointStr.split('.');
  assert(splitted.length == 2);
  final beforePoint = stripLeadingZeroes(splitted[0]);
  final afterPoint = splitted[1];

  return beforePoint + '.' + afterPoint;
}

/// Convert a string of the form 12341234.1234 to U128.
/// This is theoretically by multipliying by 10^ACCURACY.
U128 stringToAmount(String amountString) {
  if (!verifyAmountString(amountString)) {
    throw AmountError('Invalid amount string: $amountString');
  }

  final canonicalAmountStr = _canonicalizeAmountString(amountString);
  // Remove decimal point:
  final canonicalNoPointStr = canonicalAmountStr.replaceAll('.', '');

  return U128(BigInt.parse(canonicalNoPointStr));
}
