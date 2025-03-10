import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:home_asset_management_app/home/providers/pods.dart';
import 'package:homes_repository/homes_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../container.dart';
import '../../mocks.dart';
import '../../test_data.dart';

void main() {
  final mockHomesRepository = MockHomeRepository();

  setUpAll(() {
    return GetIt.I..registerSingleton<HomesRepository>(mockHomesRepository);
  });

  tearDownAll(() => GetIt.I.reset());

  test('Subscribes to the homes stream', () async {
    when(
      () => mockHomesRepository.homes,
    ).thenAnswer((_) => Stream.value(TestData.userHomes));

    final container = createContainer();
    final notifier = container.read(homeNotifierPod.notifier);

    await notifier.listenNewHomes();

    expect(notifier.state, const AsyncLoading<List<Home>>());
  });

  test('Updates the status when the data is added.', () async {
    when(
      () => mockHomesRepository.homes,
    ).thenAnswer((_) => Stream.value(TestData.userHomes));
    final container = createContainer();

    final notifier = container.read(homeNotifierPod.notifier)
      ..onNewHomes(TestData.userHomes);

    expect(notifier.state, AsyncData(TestData.userHomes));
  });
}
