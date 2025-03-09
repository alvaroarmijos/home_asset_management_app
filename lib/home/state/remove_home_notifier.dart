import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homes_repository/homes_repository.dart';

/// {@template DeleteHomeNotifier}
/// Notifier for delete home.
/// {@endtemplate}
class DeleteHomeNotifier extends StateNotifier<AsyncValue> {
  /// {@macro HomepageCubit}
  DeleteHomeNotifier({required HomesRepository homesRepository})
    : _homesRepository = homesRepository,
      super(const AsyncData(null));

  final HomesRepository _homesRepository;

  /// saves a home in the repository.
  Future<void> remove(String homeId) async {
    if (!mounted) return;

    state = const AsyncLoading();

    final result = await _homesRepository.removeById(homeId);

    state = result.when(
      ok: AsyncData.new,
      err: (e) => AsyncError(e, StackTrace.current),
    );
  }
}
