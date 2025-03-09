import 'package:assets_repository/assets_repository.dart';
import 'package:oxidized/oxidized.dart';

/// [AssetsRepositoryContract] contract APIs.
abstract class AssetsRepositoryContract {
  /// Initializes the repository.
  Future<void> initialize();

  /// Saves the given asset in the Data Store
  Future<Result<Unit, Exception>> save(Asset asset);

  /// Stream with all assets with the given [homeId] in the Data Store
  Stream<List<Asset>> getById(String homeId);

  /// Gets a list of assets available from the Data Store
  List<Asset> getAll();

  /// Saves the initial asset list with the [homeId] in the Data Store.
  Future<Result<Unit, Exception>> addDefaultAssets(String homeId);

  /// Removes all assets with the [homeId] from the Data Store
  Future<Result<Unit, Exception>> removeAllById(String homeId);
}
