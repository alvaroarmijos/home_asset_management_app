import 'package:assets_repository/assets_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_asset_management_app/app/di/di.dart';
import 'package:home_asset_management_app/home/providers/home_modal.state.dart';
import 'package:home_asset_management_app/home/providers/home_modal_notifier.dart';
import 'package:home_asset_management_app/home/providers/home_notifier.dart';
import 'package:home_asset_management_app/home/providers/remove_home_notifier.dart';
import 'package:homes_repository/homes_repository.dart';

/// The provider for the [HomeNotifier].
final homeNotifierPod =
    StateNotifierProvider<HomeNotifier, AsyncValue<List<Home>>>(
      (ref) =>
          HomeNotifier(homesRepository: getIt<HomesRepository>())
            ..listenNewHomes(),
      name: 'homeNotifierPod',
    );

/// The provider for the [HomeModalNotifier].
final homeModalNotifierPod =
    StateNotifierProvider.autoDispose<HomeModalNotifier, HomeModalState>(
      (ref) => HomeModalNotifier(
        homesRepository: getIt<HomesRepository>(),
        assetsRepository: getIt<AssetsRepository>(),
      ),
      name: 'homeModalNotifierPod',
    );

/// The provider for the [DeleteHomeNotifier].
final deleteHomeNotifierPod =
    StateNotifierProvider<DeleteHomeNotifier, AsyncValue>(
      (ref) => DeleteHomeNotifier(
        homesRepository: getIt<HomesRepository>(),
        assetsRepository: getIt<AssetsRepository>(),
      ),
      name: 'deleteHomeNotifierPod',
    );
