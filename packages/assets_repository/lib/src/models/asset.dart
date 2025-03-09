import 'package:hive/hive.dart';

part 'asset.g.dart';

@HiveType(typeId: 0)

/// {@template Asset}
/// Asset model
/// {@endtemplate}
class Asset extends HiveObject {
  /// {@macro Asset}
  Asset({
    required this.id,
    required this.name,
    required this.homeId,
    this.imageUrl,
  });

  /// Creates a empty Home
  factory Asset.empty() => Asset(
        id: '',
        name: '',
        homeId: '',
      );

  /// Asset identifier
  @HiveField(0)
  final String id;

  /// Asset name
  @HiveField(1)
  final String name;

  /// Asset home id
  @HiveField(2)
  final String homeId;

  /// Url of home image
  @HiveField(3)
  final String? imageUrl;

  /// Create a copy of Home
  Asset copyWith({
    String? id,
    String? name,
    String? homeId,
    String? imageUrl,
  }) {
    return Asset(
      id: id ?? this.id,
      name: name ?? this.name,
      homeId: homeId ?? this.homeId,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
