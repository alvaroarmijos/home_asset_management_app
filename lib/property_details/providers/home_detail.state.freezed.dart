// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_detail.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeDetailState {
  AsyncValue<Home> get home => throw _privateConstructorUsedError;
  AsyncValue<List<Asset>> get assets => throw _privateConstructorUsedError;
  List<Asset> get availableAssets => throw _privateConstructorUsedError;

  /// Create a copy of HomeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeDetailStateCopyWith<HomeDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeDetailStateCopyWith<$Res> {
  factory $HomeDetailStateCopyWith(
          HomeDetailState value, $Res Function(HomeDetailState) then) =
      _$HomeDetailStateCopyWithImpl<$Res, HomeDetailState>;
  @useResult
  $Res call(
      {AsyncValue<Home> home,
      AsyncValue<List<Asset>> assets,
      List<Asset> availableAssets});
}

/// @nodoc
class _$HomeDetailStateCopyWithImpl<$Res, $Val extends HomeDetailState>
    implements $HomeDetailStateCopyWith<$Res> {
  _$HomeDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = null,
    Object? assets = null,
    Object? availableAssets = null,
  }) {
    return _then(_value.copyWith(
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Home>,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Asset>>,
      availableAssets: null == availableAssets
          ? _value.availableAssets
          : availableAssets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeDetailStateImplCopyWith<$Res>
    implements $HomeDetailStateCopyWith<$Res> {
  factory _$$HomeDetailStateImplCopyWith(_$HomeDetailStateImpl value,
          $Res Function(_$HomeDetailStateImpl) then) =
      __$$HomeDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<Home> home,
      AsyncValue<List<Asset>> assets,
      List<Asset> availableAssets});
}

/// @nodoc
class __$$HomeDetailStateImplCopyWithImpl<$Res>
    extends _$HomeDetailStateCopyWithImpl<$Res, _$HomeDetailStateImpl>
    implements _$$HomeDetailStateImplCopyWith<$Res> {
  __$$HomeDetailStateImplCopyWithImpl(
      _$HomeDetailStateImpl _value, $Res Function(_$HomeDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = null,
    Object? assets = null,
    Object? availableAssets = null,
  }) {
    return _then(_$HomeDetailStateImpl(
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Home>,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Asset>>,
      availableAssets: null == availableAssets
          ? _value._availableAssets
          : availableAssets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
    ));
  }
}

/// @nodoc

class _$HomeDetailStateImpl implements _HomeDetailState {
  const _$HomeDetailStateImpl(
      {required this.home,
      required this.assets,
      required final List<Asset> availableAssets})
      : _availableAssets = availableAssets;

  @override
  final AsyncValue<Home> home;
  @override
  final AsyncValue<List<Asset>> assets;
  final List<Asset> _availableAssets;
  @override
  List<Asset> get availableAssets {
    if (_availableAssets is EqualUnmodifiableListView) return _availableAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableAssets);
  }

  @override
  String toString() {
    return 'HomeDetailState(home: $home, assets: $assets, availableAssets: $availableAssets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeDetailStateImpl &&
            (identical(other.home, home) || other.home == home) &&
            (identical(other.assets, assets) || other.assets == assets) &&
            const DeepCollectionEquality()
                .equals(other._availableAssets, _availableAssets));
  }

  @override
  int get hashCode => Object.hash(runtimeType, home, assets,
      const DeepCollectionEquality().hash(_availableAssets));

  /// Create a copy of HomeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeDetailStateImplCopyWith<_$HomeDetailStateImpl> get copyWith =>
      __$$HomeDetailStateImplCopyWithImpl<_$HomeDetailStateImpl>(
          this, _$identity);
}

abstract class _HomeDetailState implements HomeDetailState {
  const factory _HomeDetailState(
      {required final AsyncValue<Home> home,
      required final AsyncValue<List<Asset>> assets,
      required final List<Asset> availableAssets}) = _$HomeDetailStateImpl;

  @override
  AsyncValue<Home> get home;
  @override
  AsyncValue<List<Asset>> get assets;
  @override
  List<Asset> get availableAssets;

  /// Create a copy of HomeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeDetailStateImplCopyWith<_$HomeDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
