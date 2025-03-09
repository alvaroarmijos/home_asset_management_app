import 'dart:async';

import 'package:assets_repository/assets_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_asset_management_app/property_details/providers/home_detail.state.dart';
import 'package:homes_repository/homes_repository.dart';

/// {@template HomeDetailNotifier}
/// Notifier for the home detail.
/// {@endtemplate}
class HomeDetailNotifier extends StateNotifier<HomeDetailState> {
  /// {@macro HomepageCubit}
  HomeDetailNotifier({
    required HomesRepository homesRepository,
    required AssetsRepository assetsRepository,
  }) : _homesRepository = homesRepository,
       _assetsRepository = assetsRepository,
       super(
         const HomeDetailState(
           home: AsyncLoading(),
           assets: AsyncLoading(),
           availableAssets: [],
         ),
       );

  final HomesRepository _homesRepository;
  final AssetsRepository _assetsRepository;

  StreamSubscription<Home>? _homeSubscription;
  StreamSubscription<List<Asset>>? _assetsSubscription;

  /// Subscribes to the home and assets stream
  Future<void> listenHomeChanges(String homeId) async {
    if (!mounted) return;

    state = state.copyWith(
      home: const AsyncLoading(),
      assets: const AsyncLoading(),
      availableAssets: [],
    );

    await _homeSubscription?.cancel();
    _homeSubscription = _homesRepository.getById(homeId).listen(_onHomeChange);

    await _assetsSubscription?.cancel();
    _assetsSubscription = _assetsRepository
        .getById(homeId)
        .listen(_onAssetsChange);
  }

  /// Updates the home status when data changes.
  void _onHomeChange(Home home) {
    state = state.copyWith(home: AsyncData(home));
  }

  /// Updates the assets status when data changes.
  void _onAssetsChange(List<Asset> assets) {
    state = state.copyWith(assets: AsyncData(assets));
  }

  /// Add an asset to the home.
  Future<void> addAsset(Asset asset) async {
    if (!mounted) return;
    final currentQuantity = asset.quantity;
    await _updateAsset(asset.copyWith(quantity: currentQuantity + 1));
  }

  /// Remove an asset from the home.
  Future<void> removeAsset(Asset asset) async {
    if (!mounted) return;
    final currentQuantity = asset.quantity;
    if (currentQuantity <= 0) return;
    await _updateAsset(asset.copyWith(quantity: currentQuantity - 1));
  }

  /// Updates an assets in the repository.
  Future<void> _updateAsset(Asset asset) async {
    if (!mounted) return;
    await _assetsRepository.save(asset);
  }

  @override
  Future<void> dispose() async {
    await _homeSubscription?.cancel();
    await _assetsSubscription?.cancel();
    super.dispose();
  }
}
