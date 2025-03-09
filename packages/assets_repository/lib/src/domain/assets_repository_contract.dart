import 'package:assets_repository/assets_repository.dart';
import 'package:oxidized/oxidized.dart';

/// [AssetsRepositoryContract] contract APIs.
abstract class AssetsRepositoryContract {
  /// Initializes the repository.
  Future<void> initialize();

  /// Saves an asset in the Data Store
  Future<Result<Unit, Exception>> save(Asset asset);

  /// Removes an asset from the Data Store
  Future<Result<Unit, Exception>> removeById(String assetId);

  /// Gets a list of assets by [homeId] from the Data Store
  Stream<List<Asset>> getById(String homeId);
}
