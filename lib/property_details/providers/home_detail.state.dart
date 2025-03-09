import 'package:assets_repository/assets_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homes_repository/homes_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'home_detail.state.freezed.dart';

/// {@template HomeDetailState}
/// Home detail state
/// {@endtemplate}
@freezed
class HomeDetailState with _$HomeDetailState {
  /// Home detail state
  const factory HomeDetailState({
    required AsyncValue<Home> home,
    required AsyncValue<List<Asset>> assets,
    required List<Asset> availableAssets,
  }) = _HomeDetailState;
}
