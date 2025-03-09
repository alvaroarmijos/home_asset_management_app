import 'package:hive/hive.dart';

part 'asset.g.dart';

@HiveType(typeId: 1)

/// {@template Asset}
/// Asset model
/// {@endtemplate}
class Asset extends HiveObject {
  /// {@macro Asset}
  Asset({
    required this.id,
    required this.name,
    required this.homeId,
    required this.quantity,
  });

  /// Creates a empty Home
  factory Asset.empty() => Asset(
        id: '',
        name: '',
        homeId: '',
        quantity: 0,
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

  /// Assets quantity
  @HiveField(3)
  final int quantity;

  /// Creates a copy of Asset
  Asset copyWith({
    String? id,
    String? name,
    String? homeId,
    int? quantity,
  }) {
    return Asset(
      id: id ?? this.id,
      name: name ?? this.name,
      homeId: homeId ?? this.homeId,
      quantity: quantity ?? this.quantity,
    );
  }
}
