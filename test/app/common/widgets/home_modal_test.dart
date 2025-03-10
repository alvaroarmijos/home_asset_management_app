import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_asset_management_app/app/common/widgets/widgets.dart';
import 'package:home_asset_management_app/home/providers/home_modal.state.dart';
import 'package:home_asset_management_app/home/providers/pods.dart';

import '../../../mocks.dart';
import '../../../test_data.dart';

void main() {
  group('HomeModal create', () {
    testWidgets('should show a loading', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homeModalNotifierPod.overrideWith(
              (ref) => MockHomeModalNotifier(const HomeModalState.loading()),
            ),
          ],
          child: const MaterialApp(home: Scaffold(body: HomeModal.create())),
        ),
      );

      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Address'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should show a Button', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homeModalNotifierPod.overrideWith(
              (ref) => MockHomeModalNotifier(const HomeModalState.initial()),
            ),
          ],
          child: const MaterialApp(home: Scaffold(body: HomeModal.create())),
        ),
      );

      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Address'), findsOneWidget);
      expect(find.text('Add new Home'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Save'), findsOneWidget);
    });
  });

  group('HomeModal edit', () {
    testWidgets('should show a loading', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homeModalNotifierPod.overrideWith(
              (ref) => MockHomeModalNotifier(const HomeModalState.loading()),
            ),
          ],
          child: MaterialApp(
            home: Scaffold(body: HomeModal.edit(home: TestData.home)),
          ),
        ),
      );

      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Address'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should show a Button', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homeModalNotifierPod.overrideWith(
              (ref) => MockHomeModalNotifier(const HomeModalState.initial()),
            ),
          ],
          child: MaterialApp(
            home: Scaffold(body: HomeModal.edit(home: TestData.home)),
          ),
        ),
      );

      expect(find.text(TestData.home.name), findsOneWidget);
      expect(find.text(TestData.home.address), findsOneWidget);
      expect(find.text('Edit Home'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Update'), findsOneWidget);
    });
  });
}
