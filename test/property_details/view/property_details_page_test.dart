import 'package:assets_repository/assets_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_asset_management_app/property_details/providers/home_detail.state.dart';
import 'package:home_asset_management_app/property_details/providers/home_detail_notifier.dart';
import 'package:home_asset_management_app/property_details/providers/pods.dart';
import 'package:home_asset_management_app/property_details/view/property_details_page.dart';
import 'package:home_asset_management_app/property_details/widgets/home_assets.dart';
import 'package:home_asset_management_app/property_details/widgets/property_card.dart';
import 'package:homes_repository/homes_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../test_data.dart';

class MockHomeDetailNotifier extends HomeDetailNotifier {
  MockHomeDetailNotifier(
    this.initialState,
    this.homesRepository,
    this.assetsRepository,
  ) : super(
        homesRepository: homesRepository,
        assetsRepository: assetsRepository,
      );

  final HomeDetailState initialState;
  final HomesRepository homesRepository;
  final AssetsRepository assetsRepository;

  @override
  HomeDetailState get state => initialState;
}

void main() {
  late final MockHomeRepository homeRepository;
  late final MockAssetsRepository assetsRepository;

  setUpAll(() {
    homeRepository = MockHomeRepository();
    assetsRepository = MockAssetsRepository();
  });
  testWidgets('Should show a CircularProgressIndicator', (tester) async {
    when(
      () => homeRepository.getById(any()),
    ).thenAnswer((_) => Stream.value(TestData.home));
    when(
      () => assetsRepository.getById(any()),
    ).thenAnswer((_) => Stream.value([]));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeDetailNotifierPod.overrideWith(
            (ref) => MockHomeDetailNotifier(
              HomeDetailState(
                home: const AsyncLoading(),
                assets: const AsyncLoading(),
              ),
              homeRepository,
              assetsRepository,
            ),
          ),
        ],
        child: MaterialApp(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              settings: RouteSettings(arguments: TestData.home.id),
              builder: (BuildContext context) => const PropertyDetailsPage(),
            );
          },
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Should show a Error message', (tester) async {
    when(
      () => homeRepository.getById(any()),
    ).thenAnswer((_) => Stream.value(TestData.home));
    when(
      () => assetsRepository.getById(any()),
    ).thenAnswer((_) => Stream.value([]));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeDetailNotifierPod.overrideWith(
            (ref) => MockHomeDetailNotifier(
              HomeDetailState(
                home: AsyncError(Exception('Error'), StackTrace.current),
                assets: const AsyncLoading(),
              ),
              homeRepository,
              assetsRepository,
            ),
          ),
        ],
        child: MaterialApp(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              settings: RouteSettings(arguments: TestData.home.id),
              builder: (BuildContext context) => const PropertyDetailsPage(),
            );
          },
        ),
      ),
    );

    expect(find.text('Exception: Error'), findsOneWidget);
  });

  testWidgets('Should show Property Details', (tester) async {
    when(
      () => homeRepository.getById(any()),
    ).thenAnswer((_) => Stream.value(TestData.home));
    when(
      () => assetsRepository.getById(any()),
    ).thenAnswer((_) => Stream.value(TestData.availableAssets));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeDetailNotifierPod.overrideWith(
            (ref) => MockHomeDetailNotifier(
              HomeDetailState(
                home: AsyncData(TestData.home),
                assets: AsyncData(TestData.availableAssets),
              ),
              homeRepository,
              assetsRepository,
            ),
          ),
        ],
        child: MaterialApp(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              settings: RouteSettings(arguments: TestData.home.id),
              builder: (BuildContext context) => const PropertyDetailsPage(),
            );
          },
        ),
      ),
    );

    expect(find.text('Property Details'), findsOneWidget);
    expect(find.byType(PropertyCard), findsOneWidget);
    expect(find.byType(HomeAssets), findsOneWidget);
  });
}
