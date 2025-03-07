import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_asset_management_app/home/state/home_notifier.dart';
import 'package:homes_repository/homes_repository.dart';

/// The provider for the [HomesRepository].
final homeRepoPod = Provider((ref) => HomesRepository());

/// The provider for the [HomeNotifier].
final homeNotifierPod =
    StateNotifierProvider<HomeNotifier, AsyncValue<List<Home>>>(
      (ref) =>
          HomeNotifier(homesRepository: ref.watch(homeRepoPod))..getAllHomes(),
      name: 'homeNotifierPod',
      dependencies: [homeRepoPod],
    );
