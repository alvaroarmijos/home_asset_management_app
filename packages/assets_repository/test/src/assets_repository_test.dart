// ignore_for_file: prefer_const_constructors

import 'package:assets_repository/assets_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AssetsRepository', () {
    test('can be instantiated', () {
      expect(AssetsRepository(), isNotNull);
    });
  });
}
