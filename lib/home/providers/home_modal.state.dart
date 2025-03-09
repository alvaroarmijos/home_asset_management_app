import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_modal.state.freezed.dart';

/// {@template HomeModalState}
/// Home modal state
/// {@endtemplate}
@freezed
sealed class HomeModalState with _$HomeModalState {
  /// Home modal initial state
  const factory HomeModalState.initial({
    @Default('') String name,
    @Default('') String address,
  }) = HomeModalStateInitial;

  /// Home modal loading state
  const factory HomeModalState.loading() = HomeModalStateLoading;

  /// Home modal saved state
  const factory HomeModalState.saved() = HomeModalStateSaved;

  /// Home modal failure state
  const factory HomeModalState.failure({required String message}) =
      HomeModalStateFailure;
}
