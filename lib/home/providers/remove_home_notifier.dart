import 'package:assets_repository/assets_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homes_repository/homes_repository.dart';

/// {@template DeleteHomeNotifier}
/// Notifier for delete home.
/// {@endtemplate}
class DeleteHomeNotifier extends StateNotifier<AsyncValue> {
  /// {@macro HomepageCubit}
  DeleteHomeNotifier({
    required HomesRepository homesRepository,
    required AssetsRepository assetsRepository,
  }) : _homesRepository = homesRepository,
       _assetsRepository = assetsRepository,
       super(const AsyncData(null));

  final HomesRepository _homesRepository;
  final AssetsRepository _assetsRepository;

  /// Removes the home from the repository.
  Future<void> remove(String homeId) async {
    if (!mounted) return;

    state = const AsyncLoading();

    final result = await _homesRepository.removeById(homeId);

    state = result.when(
      ok: (_) {
        _removeAssets(homeId);
        return const AsyncData(());
      },
      err: (e) => AsyncError(e, StackTrace.current),
    );
  }

  /// Removes all assets from the given [homeId].
  Future<void> _removeAssets(String homeId) async {
    if (!mounted) return;

    await _assetsRepository.removeAllById(homeId);
  }
}
