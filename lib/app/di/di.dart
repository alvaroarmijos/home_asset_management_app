import 'package:get_it/get_it.dart';
import 'package:homes_repository/homes_repository.dart';

/// Global [GetIt] instance
final getIt = GetIt.instance;

/// The global dependencies registration method
void registerGlobalDeps() {
  getIt.registerSingleton<HomesRepository>(HomesRepository());
}

/// The global dependencies initialization method
Future<void> initializeDeps() async {
  await Future.wait<void>([getIt<HomesRepository>().initialize()]);
}
