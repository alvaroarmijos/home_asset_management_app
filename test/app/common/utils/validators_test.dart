import 'package:flutter_test/flutter_test.dart';
import 'package:home_asset_management_app/app/common/common.dart';

void main() {
  group('Name validation', () {
    test('name empty', () {
      final result = HomeValidator.nameValidation('');
      expect(result, 'Enter a name');
    });

    test('name null', () {
      final result = HomeValidator.nameValidation(null);
      expect(result, 'Enter a name');
    });

    test('name', () {
      final result = HomeValidator.nameValidation('name');
      expect(result, null);
    });
  });

  group('Address validation', () {
    test('address empty', () {
      final result = HomeValidator.addressValidation('');
      expect(result, 'Enter an address');
    });

    test('address null', () {
      final result = HomeValidator.addressValidation(null);
      expect(result, 'Enter an address');
    });

    test('address', () {
      final result = HomeValidator.addressValidation('address');
      expect(result, null);
    });
  });
}
