import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homes_repository/homes_repository.dart';

/// {@template HomeNotifier}
/// Notifier for the homepage.
/// {@endtemplate}
class HomeNotifier extends StateNotifier<AsyncValue<List<Home>>> {
  /// {@macro HomepageCubit}
  HomeNotifier({required HomesRepository homesRepository})
    : _homesRepository = homesRepository,
      super(const AsyncData([]));

  final HomesRepository _homesRepository;

  StreamSubscription<List<Home>>? _homesSubscription;

  /// Subscribes to the homes stream
  Future<void> listenNewHomes() async {
    if (!mounted) return;
    state = const AsyncLoading();
    await _homesSubscription?.cancel();
    _homesSubscription = _homesRepository.homes.listen(_onNewHomes);
  }

  /// Updates the status when the data is added.
  void _onNewHomes(List<Home> homes) {
    state = AsyncData(homes);
  }

  @override
  Future<void> dispose() async {
    await _homesSubscription?.cancel();
    super.dispose();
  }
}
