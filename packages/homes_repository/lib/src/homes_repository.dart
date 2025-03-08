import 'package:homes_repository/src/domain/homes_repository_contract.dart';
import 'package:homes_repository/src/models/home.dart';
import 'package:oxidized/oxidized.dart';

/// {@template HomesRepository}
/// [HomesRepository] get all the Homes data from Hive
/// {@endtemplate}
class HomesRepository extends HomesRepositoryContract {
  /// {@macro HomesRepository}
  HomesRepository();

  final List<Home> _homes = [
    const Home(
      id: 'id1',
      name: 'Lakeview Cabin',
      address: 'address',
      imageUrl:
          'https://resource.rentcafe.com/image/upload/q_auto,f_auto/s3/2/5963/small%20duo%20exterior-1.jpg',
    ),
    const Home(
      id: 'id2',
      name: 'Downtown Loft',
      address: 'US address.',
      imageUrl:
          'https://resource.rentcafe.com/image/upload/q_auto,f_auto/s3/2/5963/small%20duo%20exterior-1.jpg',
    ),
  ];

  @override
  Future<Result<List<Home>, Exception>> getAll() async {
    return Result.ok(_homes);
  }

  @override
  Future<Result<Unit, Exception>> save(Home home) async {
    _homes.add(home);
    return const Result.ok(unit);
  }
}
