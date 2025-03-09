import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_asset_management_app/app/di/di.dart';
import 'package:home_asset_management_app/property_details/providers/home_detail_notifier.dart';
import 'package:homes_repository/homes_repository.dart';

/// The provider for the [HomeDetailNotifier].
final homeDetailNotifierPod =
    StateNotifierProvider<HomeDetailNotifier, AsyncValue<Home?>>(
      (ref) => HomeDetailNotifier(homesRepository: getIt<HomesRepository>()),
      name: 'homeDetailNotifierPod',
      dependencies: const [],
    );
