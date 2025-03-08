import 'package:hive/hive.dart';

part 'home.g.dart';

@HiveType(typeId: 0)

/// {@template Home}
/// Home model
/// {@endtemplate}
class Home extends HiveObject {
  /// {@macro Home}
  Home({
    required this.id,
    required this.name,
    required this.address,
    this.imageUrl,
  });

  /// Home identifier
  @HiveField(0)
  final String id;

  /// Home name
  @HiveField(1)
  final String name;

  /// Home address
  @HiveField(2)
  final String address;

  /// Url of home image
  @HiveField(3)
  final String? imageUrl;
}
