import 'package:homes_repository/src/domain/homes_repository_contract.dart';
import 'package:homes_repository/src/models/home.dart';
import 'package:oxidized/oxidized.dart';

/// {@template HomesRepository}
/// [HomesRepository] get all the Homes data from Hive
/// {@endtemplate}
class HomesRepository extends HomesRepositoryContract {
  /// {@macro HomesRepository}
  HomesRepository();

  @override
  Future<Result<List<Home>, Exception>> getAll() async {
    return const Result.ok([
      Home(
        name: 'Lakeview Cabin',
        address: 'address',
        imageUrl:
            'https://resource.rentcafe.com/image/upload/q_auto,f_auto/s3/2/5963/small%20duo%20exterior-1.jpg',
      ),
      Home(
        name: 'Downtown Loft',
        address: 'US address.',
        imageUrl:
            'https://resource.rentcafe.com/image/upload/q_auto,f_auto/s3/2/5963/small%20duo%20exterior-1.jpg',
      ),
    ]);
  }
}
