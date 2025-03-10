import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_asset_management_app/app/common/widgets/home_modal.dart';
import 'package:home_asset_management_app/home/providers/home_modal.state.dart';
import 'package:home_asset_management_app/home/providers/pods.dart';
import 'package:home_asset_management_app/home/view/home_page.dart';
import 'package:home_asset_management_app/home/widgets/home_properties.dart';
import 'package:home_asset_management_app/home/widgets/property_item.dart';

import '../../mocks.dart';
import '../../test_data.dart';

void main() {
  testWidgets('Should show a CircularProgressIndicator', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeNotifierPod.overrideWith(
            (ref) => MockHomeNotifier(const AsyncLoading()),
          ),
        ],
        child: const MaterialApp(home: Scaffold(body: HomePage())),
      ),
    );

    expect(find.text('Hello!'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Should show a Error message', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeNotifierPod.overrideWith(
            (ref) => MockHomeNotifier(
              AsyncError(Exception('Error'), StackTrace.current),
            ),
          ),
        ],
        child: const MaterialApp(home: Scaffold(body: HomePage())),
      ),
    );

    expect(find.text('Hello!'), findsOneWidget);
    expect(find.text('Exception: Error'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('Should show the list of Properties', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeNotifierPod.overrideWith(
            (ref) => MockHomeNotifier(AsyncData(TestData.userHomes)),
          ),
        ],
        child: const MaterialApp(home: Scaffold(body: HomePage())),
      ),
    );

    expect(find.text('Hello!'), findsOneWidget);
    expect(find.byType(HomeProperties), findsOneWidget);
    expect(find.byType(PropertyItem), findsNWidgets(TestData.userHomes.length));
  });

  testWidgets('test Home Modal', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeNotifierPod.overrideWith(
            (ref) => MockHomeNotifier(const AsyncData([])),
          ),
          homeModalNotifierPod.overrideWith(
            (ref) => MockHomeModalNotifier(const HomeModalState.loading()),
          ),
        ],
        child: const MaterialApp(home: Scaffold(body: HomePage())),
      ),
    );
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.byType(HomeModal), findsOneWidget);
  });
}
