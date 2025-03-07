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

  /// get all homes from the repository.
  Future<void> getAllHomes() async {
    if (!mounted) return;
    state = const AsyncLoading();
    final result = await _homesRepository.getAll();

    state = result.when(
      ok: AsyncData.new,
      err: (e) => AsyncError(e, StackTrace.current),
    );
  }
}
