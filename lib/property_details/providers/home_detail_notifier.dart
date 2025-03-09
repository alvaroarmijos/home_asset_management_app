import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homes_repository/homes_repository.dart';

/// {@template HomeDetailNotifier}
/// Notifier for the home detail.
/// {@endtemplate}
class HomeDetailNotifier extends StateNotifier<AsyncValue<Home?>> {
  /// {@macro HomepageCubit}
  HomeDetailNotifier({required HomesRepository homesRepository})
    : _homesRepository = homesRepository,
      super(const AsyncData(null));

  final HomesRepository _homesRepository;

  StreamSubscription<Home>? _homeSubscription;

  /// Subscribes to the home stream
  Future<void> listenHomeChanges(String homeId) async {
    if (!mounted) return;
    state = const AsyncLoading();
    await _homeSubscription?.cancel();
    _homeSubscription = _homesRepository.getById(homeId).listen(_onHomeChange);
  }

  /// Updates the status when a data is added.
  void _onHomeChange(Home home) {
    state = AsyncData(home);
  }

  @override
  Future<void> dispose() async {
    await _homeSubscription?.cancel();
    super.dispose();
  }
}
