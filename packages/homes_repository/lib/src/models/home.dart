import 'package:freezed_annotation/freezed_annotation.dart';

part 'home.freezed.dart';

@freezed

/// {@template Home}
/// Home model
/// {@endtemplate}
abstract class Home with _$Home {
  /// {@macro Home}
  const factory Home({
    required String name,
    required String address,
    @Default(null) String? imageUrl,
  }) = _Home;
}
