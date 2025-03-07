import 'package:homes_repository/src/models/home.dart';
import 'package:oxidized/oxidized.dart';

///[HomesRepositoryContract] contract APIs.
abstract class HomesRepositoryContract {
  ///gets all the homes list from API.
  Future<Result<List<Home>, Exception>> getAll();
}
