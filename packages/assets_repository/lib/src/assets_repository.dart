import 'package:assets_repository/src/domain/assets_repository_contract.dart';
import 'package:assets_repository/src/models/asset.dart';
import 'package:hive/hive.dart';
import 'package:oxidized/src/result.dart';
import 'package:oxidized/src/unit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

/// key used in Hive for Assets
// ignore: constant_identifier_names
const String ASSETS_LOCAL_STORAGE_KEY = 'assets';

/// {@template AssetsRepository}
/// [AssetsRepository] get all the Assets data from Hive
/// {@endtemplate}
class AssetsRepository extends AssetsRepositoryContract {
  /// {@macro assets_repository}
  AssetsRepository();

  final _streamController = BehaviorSubject<List<Asset>>();

  Box<Asset> get _assetsBox => Hive.box<Asset>(ASSETS_LOCAL_STORAGE_KEY);
  List<Asset> get _assets => _assetsBox.values.toList();

  @override
  Future<void> initialize() async {
    final directory = await getApplicationSupportDirectory();
    Hive
      ..init('${directory.path}/hive/$ASSETS_LOCAL_STORAGE_KEY')
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
  Future<Result<Unit, Exception>> removeById(String assetId) {
    // TODO: implement removeById
    throw UnimplementedError();
  }

  @override
  Future<Result<Unit, Exception>> save(Asset asset) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
