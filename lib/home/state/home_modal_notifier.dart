import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_asset_management_app/home/state/home_modal.state.dart';
import 'package:homes_repository/homes_repository.dart';

/// {@template HomeModalNotifier}
/// Notifier for the homepage.
/// {@endtemplate}
class HomeModalNotifier extends StateNotifier<HomeModalState> {
  /// {@macro HomepageCubit}
  HomeModalNotifier({required HomesRepository homesRepository})
    : _homesRepository = homesRepository,
      super(const HomeModalState.initial());

  final HomesRepository _homesRepository;

  /// saves a home in the repository.
  Future<void> addHome(String name, String address) async {
    if (!mounted) return;

    state = const HomeModalState.loading();
    final home = Home(
      id: DateTime.timestamp().toIso8601String(),
      name: name,
      address: address,
    );

    final result = await _homesRepository.save(home);

    state = result.when(
      ok: (_) => const HomeModalState.saved(),
      err: (e) => HomeModalState.failure(message: e.toString()),
    );
  }

  /// Updates a home in the repository.
  Future<void> update(Home home) async {
    if (!mounted) return;

    state = const HomeModalState.loading();

    final result = await _homesRepository.save(home);

    state = result.when(
      ok: (_) => const HomeModalState.saved(),
      err: (e) => HomeModalState.failure(message: e.toString()),
    );
  }
}
