import 'package:test/test.dart';

import 'package:offset/protocol/protocol.dart';
import 'package:offset/render/utils/amount.dart';

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
    test('amountToString', () {
      expect(amountToString(U128(BigInt.from(0))), "0");
      expect(amountToString(U128(BigInt.from(1))), "0.00001");
      expect(amountToString(U128(BigInt.from(12))), "0.00012");
      expect(amountToString(U128(BigInt.from(123))), "0.00123");
      expect(amountToString(U128(BigInt.from(1234))), "0.01234");
      expect(amountToString(U128(BigInt.from(12345))), "0.12345");
      expect(amountToString(U128(BigInt.from(123456))), "1.23456");
      expect(amountToString(U128(BigInt.from(1234567))), "12.34567");
    });
    test('stringToAmount', () {
      expect(stringToAmount("0"), U128(BigInt.from(0)));
      expect(stringToAmount("0.1"), U128(BigInt.from(10000)));
      expect(stringToAmount("0.12"), U128(BigInt.from(12000)));
      expect(stringToAmount("0.123"), U128(BigInt.from(12300)));
      expect(stringToAmount("0.1234"), U128(BigInt.from(12340)));
      expect(stringToAmount("0.12345"), U128(BigInt.from(12345)));
      expect(stringToAmount("1.12345"), U128(BigInt.from(112345)));
      expect(stringToAmount("21.12345"), U128(BigInt.from(2112345)));
      expect(stringToAmount("321.12345"), U128(BigInt.from(32112345)));
      expect(stringToAmount("4321.12345"), U128(BigInt.from(432112345)));
      expect(stringToAmount("54321.12345"), U128(BigInt.from(5432112345)));
      expect(stringToAmount("654321.12345"), U128(BigInt.from(65432112345)));
      expect(stringToAmount("7654321.12345"), U128(BigInt.from(765432112345)));

      expect(stringToAmount("0.01"), U128(BigInt.from(1000)));
      expect(stringToAmount("0.001"), U128(BigInt.from(100)));
      expect(stringToAmount("0.0001"), U128(BigInt.from(10)));
      expect(stringToAmount("0.00001"), U128(BigInt.from(1)));

      expect(stringToAmount("100"), U128(BigInt.from(10000000)));
    });

    test('stringToAmount exceptions', () {
      // Using non digit symbols:
      expect(() => stringToAmount('asdf'),
          throwsA(TypeMatcher<AmountError>()));

      // Too many decimal dots:
      expect(() => stringToAmount('1234.1234.1234'),
          throwsA(TypeMatcher<AmountError>()));

      // Too many decimal symbols after dot:
      expect(() => stringToAmount('0.123456'),
          throwsA(TypeMatcher<AmountError>()));

      // Missing before decimal dot part:
      expect(() => stringToAmount('.123456'),
          throwsA(TypeMatcher<AmountError>()));
    });

    test('verifyAmountString', () {
      // Using non digit symbols:
      expect(verifyAmountString('asdf'), false);

      // Too many decimal dots:
      expect(verifyAmountString('1234.1234.1234'), false);

      // Too many decimal symbols after dot:
      expect(verifyAmountString('0.123456'), false);

      // Missing before decimal dot part:
      expect(verifyAmountString('.123456'), false);

      // Some good examples:
      expect(verifyAmountString('12345.12345'), true);
      expect(verifyAmountString('0.1234'), true);
      expect(verifyAmountString('12345'), true);
      expect(verifyAmountString('123456'), true);
    });
  });
}

