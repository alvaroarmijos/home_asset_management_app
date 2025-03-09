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

  /// Creates a empty Home
  factory Home.empty() => Home(
        id: '',
        name: '',
        address: '',
      );

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

  /// Create a copy of Home
  Home copyWith({
    String? id,
    String? name,
    String? address,
    String? imageUrl,
  }) {
    return Home(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
