import 'package:homes_repository/src/models/home.dart';
import 'package:oxidized/oxidized.dart';

///[HomesRepositoryContract] contract APIs.
abstract class HomesRepositoryContract {
  /// Initializes the repository.
  Future<void> initialize();

  /// Returns the list of available homes
  Stream<List<Home>> get homes;

  /// Saves a home in the Data Store
  Future<Result<Unit, Exception>> save(Home home);

  /// Removes a home from the Data Store
  Future<Result<Unit, Exception>> removeById(String homeId);

  /// Gets a home by id from the Data Store
  Stream<Home> getById(String homeId);
}
