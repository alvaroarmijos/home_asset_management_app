// coverage:ignore-file
import 'package:assets_repository/assets_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:homes_repository/homes_repository.dart';

/// Global [GetIt] instance
final getIt = GetIt.instance;

/// The global dependencies registration method
void registerGlobalDeps() {
  getIt
    ..registerSingleton(HomesRepository())
    ..registerSingleton(AssetsRepository());
}

/// The global dependencies initialization method
Future<void> initializeDeps() async {
  await Future.wait<void>([
    getIt<HomesRepository>().initialize(),
    getIt<AssetsRepository>().initialize(),
  ]);
}
