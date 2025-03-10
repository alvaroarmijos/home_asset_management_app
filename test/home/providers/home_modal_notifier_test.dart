import 'package:assets_repository/assets_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:home_asset_management_app/home/providers/home_modal.state.dart';
import 'package:home_asset_management_app/home/providers/pods.dart';
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
    registerFallbackValue(Home(id: '', name: 'name', address: 'address'));
    return GetIt.I
      ..registerSingleton<HomesRepository>(mockHomesRepository)
      ..registerSingleton<AssetsRepository>(mockAssetsRepository);
  });

  tearDownAll(() => GetIt.I.reset());

  group('Add home', () {
    test('save a home in the repository successfully', () async {
      when(
        () => mockHomesRepository.save(any()),
      ).thenAnswer((_) => Future.value(const Result.ok(unit)));
      when(
        () => mockAssetsRepository.addDefaultAssets(any()),
      ).thenAnswer((_) => Future.value(const Result.ok(unit)));
      final container = createContainer();
      final notifier = container.read(homeModalNotifierPod.notifier);

      await notifier.addHome('name', 'address');

      expect(notifier.state, const HomeModalState.saved());
    });

    test('save a home in the repository error', () async {
      when(
        () => mockHomesRepository.save(any()),
      ).thenAnswer((_) => Future.value(Result.err(Exception('Error'))));
      when(
        () => mockAssetsRepository.addDefaultAssets(any()),
      ).thenAnswer((_) => Future.value(const Result.ok(unit)));
      final container = createContainer();
      final notifier = container.read(homeModalNotifierPod.notifier);

      await notifier.addHome('name', 'address');

      expect(
        notifier.state,
        const HomeModalState.failure(message: 'Exception: Error'),
      );
    });
  });

  group('Add initial assets to home', () {
    test('successfully', () async {
      when(
        () => mockAssetsRepository.addDefaultAssets(any()),
      ).thenAnswer((_) => Future.value(const Result.ok(unit)));
      final container = createContainer();
      final notifier = container.read(homeModalNotifierPod.notifier);

      await notifier.addInitialAssetsToHome('homeId');

      expect(notifier.state, const HomeModalState.saved());
    });

    test('error', () async {
      when(
        () => mockAssetsRepository.addDefaultAssets(any()),
      ).thenAnswer((_) => Future.value(Result.err(Exception('Error'))));
      final container = createContainer();
      final notifier = container.read(homeModalNotifierPod.notifier);

      await notifier.addInitialAssetsToHome('homeId');

      expect(
        notifier.state,
        const HomeModalState.failure(message: 'Exception: Error'),
      );
    });
  });

  group('Update home', () {
    test('Updates a home in the repository successfully.', () async {
      when(
        () => mockHomesRepository.save(any()),
      ).thenAnswer((_) => Future.value(const Result.ok(unit)));
      final container = createContainer();
      final notifier = container.read(homeModalNotifierPod.notifier);

      await notifier.update(TestData.home);

      expect(notifier.state, const HomeModalState.saved());
    });

    test('Updates a home in the repository error', () async {
      when(
        () => mockHomesRepository.save(any()),
      ).thenAnswer((_) => Future.value(Result.err(Exception('Error'))));
      final container = createContainer();
      final notifier = container.read(homeModalNotifierPod.notifier);

      await notifier.update(TestData.home);

      expect(
        notifier.state,
        const HomeModalState.failure(message: 'Exception: Error'),
      );
    });
  });
}
