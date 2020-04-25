import 'package:test/test.dart';
import 'package:offset/fixed_point.dart';

void main() {
  group('amount format tests', () {
    test('stripLeadingZeroes', () {
      expect(stripLeadingZeroes('00001'), '1');
      expect(stripLeadingZeroes('00001234'), '1234');
      expect(stripLeadingZeroes('0000'), '0');
    });
    test('stripTrailingZeroes', () {
      expect(stripTrailingZeroes('10000'), '1');
      expect(stripTrailingZeroes('12340000'), '1234');
      expect(stripTrailingZeroes('0000'), '0');
    });
    test('bigIntToFixed', () {
      expect(bigIntToFixed(BigInt.from(0), 5), "0");
      expect(bigIntToFixed(BigInt.from(1), 5), "0.00001");
      expect(bigIntToFixed(BigInt.from(12), 5), "0.00012");
      expect(bigIntToFixed(BigInt.from(123), 5), "0.00123");
      expect(bigIntToFixed(BigInt.from(1234), 5), "0.01234");
      expect(bigIntToFixed(BigInt.from(12345), 5), "0.12345");
      expect(bigIntToFixed(BigInt.from(123456), 5), "1.23456");
      expect(bigIntToFixed(BigInt.from(1234567), 5), "12.34567");
      expect(bigIntToFixed(BigInt.from(-1), 5), "-0.00001");
      expect(bigIntToFixed(BigInt.from(-12), 5), "-0.00012");
      expect(bigIntToFixed(BigInt.from(-123), 5), "-0.00123");
      expect(bigIntToFixed(BigInt.from(-1234), 5), "-0.01234");
      expect(bigIntToFixed(BigInt.from(-12345), 5), "-0.12345");
      expect(bigIntToFixed(BigInt.from(-123456), 5), "-1.23456");
      expect(bigIntToFixed(BigInt.from(-1234567), 5), "-12.34567");
    });
    test('fixedToBigInt', () {
      expect(fixedToBigInt("0", 5), BigInt.from(0));
      expect(fixedToBigInt("0.000", 5), BigInt.from(0));
      expect(fixedToBigInt("000.000", 5), BigInt.from(0));
      expect(fixedToBigInt("0.1", 5), BigInt.from(10000));
      expect(fixedToBigInt("0.12", 5), BigInt.from(12000));
      expect(fixedToBigInt("0.123", 5), BigInt.from(12300));
      expect(fixedToBigInt("0.1234", 5), BigInt.from(12340));
      expect(fixedToBigInt("0.12345", 5), BigInt.from(12345));
      expect(fixedToBigInt("1.12345", 5), BigInt.from(112345));
      expect(fixedToBigInt("21.12345", 5), BigInt.from(2112345));
      expect(fixedToBigInt("321.12345", 5), BigInt.from(32112345));
      expect(fixedToBigInt("4321.12345", 5), BigInt.from(432112345));
      expect(fixedToBigInt("54321.12345", 5), BigInt.from(5432112345));
      expect(fixedToBigInt("654321.12345", 5), BigInt.from(65432112345));
      expect(fixedToBigInt("7654321.12345", 5), BigInt.from(765432112345));

      expect(fixedToBigInt("-0", 5), BigInt.from(0));
      expect(fixedToBigInt("-0.0000", 5), BigInt.from(0));
      expect(fixedToBigInt("-000.0000", 5), BigInt.from(0));
      expect(fixedToBigInt("-0.1", 5), BigInt.from(-10000));
      expect(fixedToBigInt("-0.12", 5), BigInt.from(-12000));
      expect(fixedToBigInt("-0.123", 5), BigInt.from(-12300));
      expect(fixedToBigInt("-0.1234", 5), BigInt.from(-12340));
      expect(fixedToBigInt("-0.12345", 5), BigInt.from(-12345));
      expect(fixedToBigInt("-1.12345", 5), BigInt.from(-112345));
      expect(fixedToBigInt("-21.12345", 5), BigInt.from(-2112345));
      expect(fixedToBigInt("-321.12345", 5), BigInt.from(-32112345));
      expect(fixedToBigInt("-4321.12345", 5), BigInt.from(-432112345));
      expect(fixedToBigInt("-54321.12345", 5), BigInt.from(-5432112345));
      expect(fixedToBigInt("-654321.12345", 5), BigInt.from(-65432112345));
      expect(fixedToBigInt("-7654321.12345", 5), BigInt.from(-765432112345));

      expect(fixedToBigInt("0.01", 5), BigInt.from(1000));
      expect(fixedToBigInt("0.001", 5), BigInt.from(100));
      expect(fixedToBigInt("0.0001", 5), BigInt.from(10));
      expect(fixedToBigInt("0.00001", 5), BigInt.from(1));

      expect(fixedToBigInt("100", 5), BigInt.from(10000000));
    });

    test('fixedToBigInt exceptions', () {
      // Empty string
      expect(
          () => fixedToBigInt('', 5), throwsA(TypeMatcher<FixedPointError>()));

      // Only a dot:
      expect(
          () => fixedToBigInt('.', 5), throwsA(TypeMatcher<FixedPointError>()));

      // No prefix
      expect(() => fixedToBigInt('.12', 5),
          throwsA(TypeMatcher<FixedPointError>()));

      // No suffix
      expect(() => fixedToBigInt('12.', 5),
          throwsA(TypeMatcher<FixedPointError>()));

      // Using non digit symbols:
      expect(() => fixedToBigInt('asdf', 5),
          throwsA(TypeMatcher<FixedPointError>()));

      // Too many decimal dots:
      expect(() => fixedToBigInt('1234.1234.1234', 5),
          throwsA(TypeMatcher<FixedPointError>()));

      // Too many decimal symbols after dot:
      expect(() => fixedToBigInt('0.123456', 5),
          throwsA(TypeMatcher<FixedPointError>()));
    });

    test('verifyFixed', () {
      // Empty string:
      expect(verifyFixed('', 5), false);

      // Only a dot
      expect(verifyFixed('.', 5), false);

      // Minus dot
      expect(verifyFixed('-.', 5), false);

      // No prefix
      expect(verifyFixed('.12', 5), false);

      // No suffix
      expect(verifyFixed('12.', 5), false);

      // Using non digit symbols:
      expect(verifyFixed('asdf', 5), false);

      // Too many decimal dots:
      expect(verifyFixed('1234.1234.1234', 5), false);

      // Too many decimal symbols after dot:
      expect(verifyFixed('0.123456', 5), false);

      // Missing before decimal dot part:
      expect(verifyFixed('.123456', 5), false);

      // Some good examples:
      expect(verifyFixed('12345.12345', 5), true);
      expect(verifyFixed('0.1234', 5), true);
      expect(verifyFixed('12345', 5), true);
      expect(verifyFixed('123456', 5), true);
    });
  });
}
