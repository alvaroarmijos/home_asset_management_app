import 'package:homes_repository/src/models/home.dart';
import 'package:oxidized/oxidized.dart';

///[HomesRepositoryContract] contract APIs.
abstract class HomesRepositoryContract {
  /// Initializes the repository.
  Future<void> initialize();

  /// Returns the list of available homes
  Stream<List<Home>> get homes;

  ///saves a home in the Data Store
  Future<Result<Unit, Exception>> save(Home home);
}
