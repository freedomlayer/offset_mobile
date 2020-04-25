import '../../error.dart';
import '../../protocol/protocol.dart';
import '../../fixed_point.dart';

class AmountError extends AppError {
  AmountError(cause) : super(cause);
}

// Amount of decimal places to keep after the decimal point:
const int ACCURACY = 5;

// Amount of decimal places to keep after the decimal point:
const int PERCENT_ACCURACY = 3;

/// Convert U128 amount, divided by 10^ACCURACY, to a string with a decimal point.
String amountToString(U128 amount) {
  return bigIntToFixed(amount.inner, ACCURACY);
}

/// Convert a string of the form 12341234.1234 to U128.
/// This is theoretically by multipliying by 10^ACCURACY.
U128 stringToAmount(String amountString) {
  BigInt value;
  try {
    value = fixedToBigInt(amountString, ACCURACY);
  } on FixedPointError catch (e) {
    throw AmountError(e.toString());
  }

  if (value.isNegative) {
    throw AmountError('Given value $amountString is negative!');
  }

  if (value.bitLength > 128) {
    throw AmountError('Given value $amountString is too large!');
  }
  return U128(value);
}

/// Check if amount string is valid
bool verifyAmountString(String amountString) {
  try {
    final _ = stringToAmount(amountString);
    return true;
  } on AmountError {
    return false;
  }
}

/// Convert (signed) balance to string
String balanceToString(I128 balance) {
  return bigIntToFixed(balance.inner, ACCURACY);
}

/// Convert a balance string (Possibly begins with a '-' sign) to I128 balance.
I128 stringToBalance(String balanceString) {
  BigInt value;
  try {
    value = fixedToBigInt(balanceString, ACCURACY);
  } on FixedPointError catch (e) {
    throw AmountError(e.toString());
  }

  if (value.bitLength > 128) {
    throw AmountError('Given value $balanceString is too large!');
  }

  return I128(value);
}

/// Check if balance string is valid
bool verifyBalanceString(String balanceString) {
  try {
    final _ = stringToBalance(balanceString);
    return true;
  } on AmountError {
    return false;
  }
}

/// Convert a multiplicative rate to a decimal percent value.
/// Examples:
/// 0 -> '0'
/// 2^16 -> '0.5'
String mulRateToPercentString(int mulRate) {
  final double ratePercent = (mulRate / (1 << 32)) * 100;
  return ratePercent.toStringAsFixed(PERCENT_ACCURACY);
}

/// Convert a rate percent string to multiplicate rate
int percentStringToMulRate(String percentString) {
  double frac;
  try {
    frac = double.parse(percentString) / 100.0;
  } catch (e) {
    throw AmountError('Failed to parse value $percentString');
  }

  if (frac < 0.0 || frac > 1.0) {
    throw AmountError('percentString out of range: $percentString');
  }

  return (frac * (1 << 32)).ceil();
}
