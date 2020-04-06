import 'error.dart';

class FixedPointError extends AppError {
  FixedPointError(cause) : super(cause);
}

// Amount of decimal places to keep after the decimal point:
// const int ACCURACY = 5;

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

/// Convert value, divided by 10^accuracy, to a string with a decimal point.
String bigIntToFixed(BigInt value, int accuracy) {
  final signStr = value.isNegative ? '-' : '';
  final valueStr = value.abs().toString();

  final resStr = valueStr.length <= accuracy
      ? '0.' + ('0' * (accuracy - valueStr.length)) + valueStr
      : valueStr.substring(0, valueStr.length - accuracy) +
          '.' +
          valueStr.substring(valueStr.length - accuracy);

  final splitted = resStr.split('.');
  assert(splitted.length == 2);
  final beforePoint = stripLeadingZeroes(splitted[0]);
  final afterPoint = stripTrailingZeroes(splitted[1]);

  if (beforePoint.isEmpty || beforePoint == '0') {
    if (afterPoint.isEmpty || afterPoint == '0') {
      return signStr + '0';
    } else {
      return signStr + '0.' + afterPoint;
    }
  } else {
    if (afterPoint.isEmpty || afterPoint == '0') {
      return signStr + beforePoint;
    } else {
      return signStr + beforePoint + '.' + afterPoint;
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

bool verifyFixed(String valueString, int accuracy) {
  if (valueString.isEmpty) {
    return false;
  }

  final absValueString =
      valueString[0] == '-' ? valueString.substring(1) : valueString;

  final splitted = absValueString.split('.');
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
        return (splitted[0].length > 0) && _isAllDigits(splitted[0]);
      }
      break;
    case 2:
      {
        return (splitted[0].length > 0) &&
            _isAllDigits(splitted[0]) &&
            (splitted[1].length > 0) &&
            _isAllDigits(splitted[1]) &&
            splitted[1].length <= accuracy;
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
/// there are `accuracy` digits after the decimal point.
/// Examples:
/// 1234.5  -> 1234.50000
/// 12      -> 12.00000
/// 000012  -> 12.00000
String _canonicalizeAmountString(String valueString, int accuracy) {
  var signStr = '';
  var absValueString = valueString;
  assert(valueString.isNotEmpty);
  if (valueString[0] == '-') {
    signStr = '-';
    absValueString = valueString.substring(1);
  }

  // Find decimal point.
  final pointIndex = absValueString.indexOf('.');
  assert(absValueString.length - pointIndex - 1 <= accuracy);

  // Find decimal point or add one ourselves.
  // Make sure that we have exactly `accuracy` decimal digits after the decimal point:
  final String pointStr = pointIndex < 0
      ? absValueString + '.' + '0' * accuracy
      : absValueString +
          '0' * (accuracy - (absValueString.length - pointIndex - 1));

  // Split to two parts: Before and after point:
  final splitted = pointStr.split('.');
  assert(splitted.length == 2);
  final beforePoint = stripLeadingZeroes(splitted[0]);
  final afterPoint = splitted[1];

  return signStr + beforePoint + '.' + afterPoint;
}

/// Convert a string of the form 12341234.1234 to U128.
/// This is theoretically by multipliying by 10^accuracy.
BigInt fixedToBigInt(String amountString, int accuracy) {
  if (!verifyFixed(amountString, accuracy)) {
    throw FixedPointError('Invalid amount string: $amountString');
  }

  final canonicalAmountStr = _canonicalizeAmountString(amountString, accuracy);
  // Remove decimal point:
  final canonicalNoPointStr = canonicalAmountStr.replaceAll('.', '');

  return BigInt.parse(canonicalNoPointStr);
}
