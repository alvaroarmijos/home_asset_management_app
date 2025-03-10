import 'package:assets_repository/assets_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:home_asset_management_app/property_details/providers/home_detail.state.dart';
import 'package:home_asset_management_app/property_details/providers/pods.dart';
import 'package:homes_repository/homes_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oxidized/oxidized.dart';

import '../../container.dart';
import '../../mocks.dart';
import '../../test_data.dart';

void main() {
  final mockHomesRepository = MockHomeRepository();
  final mockAssetsRepository = MockAssetsRepository();

  setUpAll(() {
    registerFallbackValue(TestData.homeAsset);
    return GetIt.I
      ..registerSingleton<HomesRepository>(mockHomesRepository)
      ..registerSingleton<AssetsRepository>(mockAssetsRepository);
  });

  tearDownAll(() => GetIt.I.reset());

  test('save a home in the repository successfully', () async {
    when(
      () => mockHomesRepository.getById(any()),
    ).thenAnswer((_) => Stream.value(TestData.home));
    when(
      () => mockAssetsRepository.getById(any()),
    ).thenAnswer((_) => Stream.value(TestData.availableAssets));
    final container = createContainer();
    final notifier = container.read(homeDetailNotifierPod.notifier);

    await notifier.listenHomeChanges('id');

    expect(
      notifier.state,
      HomeDetailState(
        home: AsyncData(TestData.home),
        assets: const AsyncLoading(),
      ),
    );
  });

  test('onHomeChange', () async {
    final container = createContainer();
    final notifier = container.read(homeDetailNotifierPod.notifier)
      ..onHomeChange(TestData.home);

    expect(
      notifier.state,
      HomeDetailState(
        home: AsyncData(TestData.home),
        assets: const AsyncLoading(),
      ),
    );
  });

  test('onAssetsChange', () async {
    final container = createContainer();
    final notifier = container.read(homeDetailNotifierPod.notifier)
      ..onAssetsChange(TestData.availableAssets);

    expect(
      notifier.state,
      HomeDetailState(
        home: const AsyncLoading(),
        assets: AsyncData(TestData.availableAssets),
      ),
    );
  });

  test('addAsset', () async {
    when(
      () => mockAssetsRepository.save(any()),
    ).thenAnswer((_) => Future.value(const Result.ok(unit)));
    final container = createContainer();
    final notifier = container.read(homeDetailNotifierPod.notifier);

    await notifier.addAsset(TestData.homeAsset);

    verify(() => mockAssetsRepository.save(any())).called(1);
  });

  test('removeAsset', () async {
    when(
      () => mockAssetsRepository.save(any()),
    ).thenAnswer((_) => Future.value(const Result.ok(unit)));
    final container = createContainer();
    final notifier = container.read(homeDetailNotifierPod.notifier);

    await notifier.removeAsset(TestData.homeAsset.copyWith(quantity: 1));

    verify(() => mockAssetsRepository.save(any())).called(1);
  });
}
