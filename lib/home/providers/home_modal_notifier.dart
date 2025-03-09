import 'package:assets_repository/assets_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_asset_management_app/home/providers/home_modal.state.dart';
import 'package:homes_repository/homes_repository.dart';

/// {@template HomeModalNotifier}
/// Notifier for the Home modal.
/// {@endtemplate}
class HomeModalNotifier extends StateNotifier<HomeModalState> {
  /// {@macro HomepageCubit}
  HomeModalNotifier({
    required HomesRepository homesRepository,
    required AssetsRepository assetsRepository,
  }) : _homesRepository = homesRepository,
       _assetsRepository = assetsRepository,
       super(const HomeModalState.initial());

  final HomesRepository _homesRepository;
  final AssetsRepository _assetsRepository;

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
      ok: (_) {
        _addInitialAssetsToHome(home.id);
        return const HomeModalState.saved();
      },
      err: (e) => HomeModalState.failure(message: e.toString()),
    );
  }

  /// saves the Home assets in the repository.
  Future<void> _addInitialAssetsToHome(String homeId) async {
    if (!mounted) return;

    final result = await _assetsRepository.addDefaultAssets(homeId);
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
