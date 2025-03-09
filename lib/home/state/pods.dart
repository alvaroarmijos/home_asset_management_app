import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_asset_management_app/app/di/di.dart';
import 'package:home_asset_management_app/home/state/home_modal.state.dart';
import 'package:home_asset_management_app/home/state/home_modal_notifier.dart';
import 'package:home_asset_management_app/home/state/home_notifier.dart';
import 'package:home_asset_management_app/home/state/remove_home_notifier.dart';
import 'package:homes_repository/homes_repository.dart';

/// The provider for the [HomeNotifier].
final homeNotifierPod =
    StateNotifierProvider<HomeNotifier, AsyncValue<List<Home>>>(
      (ref) =>
          HomeNotifier(homesRepository: getIt<HomesRepository>())
            ..listenNewHomes(),
      name: 'homeNotifierPod',
      dependencies: const [],
    );

/// The provider for the [HomeModalNotifier].
final homeModalNotifierPod =
    StateNotifierProvider.autoDispose<HomeModalNotifier, HomeModalState>(
      (ref) => HomeModalNotifier(homesRepository: getIt<HomesRepository>()),
      name: 'homeModalNotifierPod',
      dependencies: const [],
    );

/// The provider for the [DeleteHomeNotifier].
final deleteHomeNotifierPod =
    StateNotifierProvider<DeleteHomeNotifier, AsyncValue>(
      (ref) => DeleteHomeNotifier(homesRepository: getIt<HomesRepository>()),
      name: 'deleteHomeNotifierPod',
      dependencies: const [],
    );
