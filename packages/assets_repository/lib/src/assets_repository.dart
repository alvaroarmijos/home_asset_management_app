import 'package:assets_repository/src/assets_data.dart';
import 'package:assets_repository/src/domain/assets_repository_contract.dart';
import 'package:assets_repository/src/models/asset.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:oxidized/src/result.dart';
import 'package:oxidized/src/unit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

/// key used in Hive for Assets
// ignore: constant_identifier_names
const String ASSETS_LOCAL_STORAGE_KEY = 'assets';

/// {@template AssetsRepository}
/// [AssetsRepository] Get all the Home Assets from Hive
/// {@endtemplate}
class AssetsRepository extends AssetsRepositoryContract {
  /// {@macro assets_repository}
  AssetsRepository();

  final _streamController = BehaviorSubject<List<Asset>>();

  Box<Asset> get _assetsBox => Hive.box<Asset>(ASSETS_LOCAL_STORAGE_KEY);
  List<Asset> get _assets => _assetsBox.values.toList();

  @override
  Future<void> initialize() async {
    late String path;
    if (kIsWeb) {
      path = '/homeAssetManagement/hive/$ASSETS_LOCAL_STORAGE_KEY';
    } else {
      final directory = await getApplicationSupportDirectory();
      path = '${directory.path}/hive/$ASSETS_LOCAL_STORAGE_KEY';
    }
    Hive
      ..init(path)
      ..registerAdapter(AssetAdapter());
    await Hive.openBox<Asset>(ASSETS_LOCAL_STORAGE_KEY);
    _streamController.add(_assets);
  }

  @override
  Stream<List<Asset>> getById(String homeId) {
    return _streamController.stream.map(
      (assets) => assets
          .where(
            (asset) => asset.homeId == homeId,
          )
          .toList(),
    );
  }

  @override
  Future<Result<Unit, Exception>> addDefaultAssets(String homeId) async {
    try {
      final newAssets = getAll().map((asset) => asset.copyWith(homeId: homeId));
      await _assetsBox.addAll(newAssets);
      _streamController.add(_assets);
      return const Result.ok(unit);
    } catch (e) {
      return Result.err(Exception('Unable to save assets $homeId'));
    }
  }

  @override
  Future<Result<Unit, Exception>> save(Asset asset) async {
    try {
      final index = _assets.indexWhere(
        (data) => asset.id == data.id && asset.homeId == data.homeId,
      );
      if (index == -1) return const Result.ok(unit);
      final key = _assetsBox.keyAt(index);
      await _assetsBox.put(key, asset);
      _streamController.add(_assets);
      return const Result.ok(unit);
    } catch (e) {
      return Result.err(Exception('Unable to save information $e'));
    }
  }

  @override
  List<Asset> getAll() => availableAssets;

  @override
  Future<Result<Unit, Exception>> removeAllById(String homeId) async {
    try {
      final homeAssets = _assets.where((asset) => asset.homeId == homeId);
      for (final asset in homeAssets) {
        final index = _assets.indexWhere((data) => asset.id == data.id);
        if (index == -1) return const Result.ok(unit);
        final key = _assetsBox.keyAt(index);
        await _assetsBox.delete(key);
      }
      _streamController.add(_assets);
      return const Result.ok(unit);
    } catch (e) {
      return Result.err(Exception('Unable to delete home $homeId'));
    }
  }
}
