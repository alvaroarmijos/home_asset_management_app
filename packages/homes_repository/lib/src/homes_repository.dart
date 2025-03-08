// ignore_for_file: public_member_api_docs, constant_identifier_names

import 'dart:async';

import 'package:hive/hive.dart';
import 'package:homes_repository/src/domain/homes_repository_contract.dart';
import 'package:homes_repository/src/models/home.dart';
import 'package:oxidized/oxidized.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';

const String HOMES_LOCAL_STORAGE_KEY = 'homes';

/// {@template HomesRepository}
/// [HomesRepository] get all the Homes data from Hive
/// {@endtemplate}
class HomesRepository extends HomesRepositoryContract {
  /// {@macro HomesRepository}
  HomesRepository();

  final _initialized = Completer<void>();

  Box<Home> get _homesBox => Hive.box<Home>(HOMES_LOCAL_STORAGE_KEY);

  final _streamController = BehaviorSubject<List<Home>>();

  /// Stream of user homes.
  @override
  Stream<List<Home>> get homes => _streamController.stream;

  @override
  Future<void> initialize() async {
    final directory = await getApplicationSupportDirectory();
    Hive
      ..init('${directory.path}/hive')
      ..registerAdapter(HomeAdapter());
    final box = await Hive.openBox<Home>(HOMES_LOCAL_STORAGE_KEY);
    _streamController.add(box.values.toList());
    if (!_initialized.isCompleted) _initialized.complete();
  }

  @override
  Future<Result<Unit, Exception>> save(Home home) async {
    try {
      await _homesBox.put(home.id, home);
      _streamController.add(_homesBox.values.toList());
      return const Result.ok(unit);
    } catch (e) {
      return Result.err(Exception('Unable to save information $e'));
    }
  }
}
