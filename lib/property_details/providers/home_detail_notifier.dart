import 'dart:async';

import 'package:assets_repository/assets_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homes_repository/homes_repository.dart';

/// {@template HomeDetailNotifier}
/// Notifier for the home detail.
/// {@endtemplate}
class HomeDetailNotifier extends StateNotifier<AsyncValue<Home?>> {
  /// {@macro HomepageCubit}
  HomeDetailNotifier({
    required HomesRepository homesRepository,
    required AssetsRepository assetsRepository,
  }) : _homesRepository = homesRepository,
       _assetsRepository = assetsRepository,
       super(const AsyncData(null));

  final HomesRepository _homesRepository;
  final AssetsRepository _assetsRepository;

  StreamSubscription<Home>? _homeSubscription;
  StreamSubscription<List<Asset>>? _assetsSubscription;

  /// Subscribes to the home stream
  Future<void> listenHomeChanges(String homeId) async {
    if (!mounted) return;
    state = const AsyncLoading();
    await _homeSubscription?.cancel();
    _homeSubscription = _homesRepository.getById(homeId).listen(_onHomeChange);
    await _assetsSubscription?.cancel();
    _assetsSubscription = _assetsRepository
        .getById(homeId)
        .listen(_onAssetsChange);
  }

  /// Updates the status when a data is added.
  void _onHomeChange(Home home) {
    state = AsyncData(home);
  }

  /// Updates the status when a data is added.
  void _onAssetsChange(List<Asset> assets) {
    // state = AsyncData(home);
  }

  @override
  Future<void> dispose() async {
    await _homeSubscription?.cancel();
    await _assetsSubscription?.cancel();
    super.dispose();
  }
}
