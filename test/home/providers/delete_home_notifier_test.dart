import 'package:assets_repository/assets_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:home_asset_management_app/home/providers/pods.dart';
import 'package:homes_repository/homes_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oxidized/oxidized.dart';

import '../../container.dart';
import '../../mocks.dart';

void main() {
  final mockHomesRepository = MockHomeRepository();
  final mockAssetsRepository = MockAssetsRepository();

  setUpAll(() {
    return GetIt.I
      ..registerSingleton<HomesRepository>(mockHomesRepository)
      ..registerSingleton<AssetsRepository>(mockAssetsRepository);
  });

  tearDownAll(() => GetIt.I.reset());

  test('Removes the home from the repository successfully', () async {
    when(
      () => mockHomesRepository.removeById(any()),
    ).thenAnswer((_) => Future.value(const Result.ok(unit)));
    when(
      () => mockAssetsRepository.removeAllById(any()),
    ).thenAnswer((_) => Future.value(const Result.ok(unit)));
    final container = createContainer();
    final notifier = container.read(deleteHomeNotifierPod.notifier);

    await notifier.remove('id');

    expect(notifier.state, const AsyncData<dynamic>(()));
  });
}
