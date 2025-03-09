// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_modal.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeModalState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String address) initial,
    required TResult Function() loading,
    required TResult Function() saved,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String address)? initial,
    TResult? Function()? loading,
    TResult? Function()? saved,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String address)? initial,
    TResult Function()? loading,
    TResult Function()? saved,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeModalStateInitial value) initial,
    required TResult Function(HomeModalStateLoading value) loading,
    required TResult Function(HomeModalStateSaved value) saved,
    required TResult Function(HomeModalStateFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeModalStateInitial value)? initial,
    TResult? Function(HomeModalStateLoading value)? loading,
    TResult? Function(HomeModalStateSaved value)? saved,
    TResult? Function(HomeModalStateFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeModalStateInitial value)? initial,
    TResult Function(HomeModalStateLoading value)? loading,
    TResult Function(HomeModalStateSaved value)? saved,
    TResult Function(HomeModalStateFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeModalStateCopyWith<$Res> {
  factory $HomeModalStateCopyWith(
          HomeModalState value, $Res Function(HomeModalState) then) =
      _$HomeModalStateCopyWithImpl<$Res, HomeModalState>;
}

/// @nodoc
class _$HomeModalStateCopyWithImpl<$Res, $Val extends HomeModalState>
    implements $HomeModalStateCopyWith<$Res> {
  _$HomeModalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeModalState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HomeModalStateInitialImplCopyWith<$Res> {
  factory _$$HomeModalStateInitialImplCopyWith(
          _$HomeModalStateInitialImpl value,
          $Res Function(_$HomeModalStateInitialImpl) then) =
      __$$HomeModalStateInitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String address});
}

/// @nodoc
class __$$HomeModalStateInitialImplCopyWithImpl<$Res>
    extends _$HomeModalStateCopyWithImpl<$Res, _$HomeModalStateInitialImpl>
    implements _$$HomeModalStateInitialImplCopyWith<$Res> {
  __$$HomeModalStateInitialImplCopyWithImpl(_$HomeModalStateInitialImpl _value,
      $Res Function(_$HomeModalStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeModalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
  }) {
    return _then(_$HomeModalStateInitialImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeModalStateInitialImpl implements HomeModalStateInitial {
  const _$HomeModalStateInitialImpl({this.name = '', this.address = ''});

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String address;

  @override
  String toString() {
    return 'HomeModalState.initial(name: $name, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeModalStateInitialImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, address);

  /// Create a copy of HomeModalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeModalStateInitialImplCopyWith<_$HomeModalStateInitialImpl>
      get copyWith => __$$HomeModalStateInitialImplCopyWithImpl<
          _$HomeModalStateInitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String address) initial,
    required TResult Function() loading,
    required TResult Function() saved,
    required TResult Function(String message) failure,
  }) {
    return initial(name, address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String address)? initial,
    TResult? Function()? loading,
    TResult? Function()? saved,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call(name, address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String address)? initial,
    TResult Function()? loading,
    TResult Function()? saved,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(name, address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeModalStateInitial value) initial,
    required TResult Function(HomeModalStateLoading value) loading,
    required TResult Function(HomeModalStateSaved value) saved,
    required TResult Function(HomeModalStateFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeModalStateInitial value)? initial,
    TResult? Function(HomeModalStateLoading value)? loading,
    TResult? Function(HomeModalStateSaved value)? saved,
    TResult? Function(HomeModalStateFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeModalStateInitial value)? initial,
    TResult Function(HomeModalStateLoading value)? loading,
    TResult Function(HomeModalStateSaved value)? saved,
    TResult Function(HomeModalStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class HomeModalStateInitial implements HomeModalState {
  const factory HomeModalStateInitial(
      {final String name, final String address}) = _$HomeModalStateInitialImpl;

  String get name;
  String get address;

  /// Create a copy of HomeModalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeModalStateInitialImplCopyWith<_$HomeModalStateInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeModalStateLoadingImplCopyWith<$Res> {
  factory _$$HomeModalStateLoadingImplCopyWith(
          _$HomeModalStateLoadingImpl value,
          $Res Function(_$HomeModalStateLoadingImpl) then) =
      __$$HomeModalStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeModalStateLoadingImplCopyWithImpl<$Res>
    extends _$HomeModalStateCopyWithImpl<$Res, _$HomeModalStateLoadingImpl>
    implements _$$HomeModalStateLoadingImplCopyWith<$Res> {
  __$$HomeModalStateLoadingImplCopyWithImpl(_$HomeModalStateLoadingImpl _value,
      $Res Function(_$HomeModalStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeModalState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeModalStateLoadingImpl implements HomeModalStateLoading {
  const _$HomeModalStateLoadingImpl();

  @override
  String toString() {
    return 'HomeModalState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeModalStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String address) initial,
    required TResult Function() loading,
    required TResult Function() saved,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String address)? initial,
    TResult? Function()? loading,
    TResult? Function()? saved,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String address)? initial,
    TResult Function()? loading,
    TResult Function()? saved,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeModalStateInitial value) initial,
    required TResult Function(HomeModalStateLoading value) loading,
    required TResult Function(HomeModalStateSaved value) saved,
    required TResult Function(HomeModalStateFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeModalStateInitial value)? initial,
    TResult? Function(HomeModalStateLoading value)? loading,
    TResult? Function(HomeModalStateSaved value)? saved,
    TResult? Function(HomeModalStateFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeModalStateInitial value)? initial,
    TResult Function(HomeModalStateLoading value)? loading,
    TResult Function(HomeModalStateSaved value)? saved,
    TResult Function(HomeModalStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeModalStateLoading implements HomeModalState {
  const factory HomeModalStateLoading() = _$HomeModalStateLoadingImpl;
}

/// @nodoc
abstract class _$$HomeModalStateSavedImplCopyWith<$Res> {
  factory _$$HomeModalStateSavedImplCopyWith(_$HomeModalStateSavedImpl value,
          $Res Function(_$HomeModalStateSavedImpl) then) =
      __$$HomeModalStateSavedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeModalStateSavedImplCopyWithImpl<$Res>
    extends _$HomeModalStateCopyWithImpl<$Res, _$HomeModalStateSavedImpl>
    implements _$$HomeModalStateSavedImplCopyWith<$Res> {
  __$$HomeModalStateSavedImplCopyWithImpl(_$HomeModalStateSavedImpl _value,
      $Res Function(_$HomeModalStateSavedImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeModalState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeModalStateSavedImpl implements HomeModalStateSaved {
  const _$HomeModalStateSavedImpl();

  @override
  String toString() {
    return 'HomeModalState.saved()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeModalStateSavedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String address) initial,
    required TResult Function() loading,
    required TResult Function() saved,
    required TResult Function(String message) failure,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String address)? initial,
    TResult? Function()? loading,
    TResult? Function()? saved,
    TResult? Function(String message)? failure,
  }) {
    return saved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String address)? initial,
    TResult Function()? loading,
    TResult Function()? saved,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeModalStateInitial value) initial,
    required TResult Function(HomeModalStateLoading value) loading,
    required TResult Function(HomeModalStateSaved value) saved,
    required TResult Function(HomeModalStateFailure value) failure,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeModalStateInitial value)? initial,
    TResult? Function(HomeModalStateLoading value)? loading,
    TResult? Function(HomeModalStateSaved value)? saved,
    TResult? Function(HomeModalStateFailure value)? failure,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeModalStateInitial value)? initial,
    TResult Function(HomeModalStateLoading value)? loading,
    TResult Function(HomeModalStateSaved value)? saved,
    TResult Function(HomeModalStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class HomeModalStateSaved implements HomeModalState {
  const factory HomeModalStateSaved() = _$HomeModalStateSavedImpl;
}

/// @nodoc
abstract class _$$HomeModalStateFailureImplCopyWith<$Res> {
  factory _$$HomeModalStateFailureImplCopyWith(
          _$HomeModalStateFailureImpl value,
          $Res Function(_$HomeModalStateFailureImpl) then) =
      __$$HomeModalStateFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$HomeModalStateFailureImplCopyWithImpl<$Res>
    extends _$HomeModalStateCopyWithImpl<$Res, _$HomeModalStateFailureImpl>
    implements _$$HomeModalStateFailureImplCopyWith<$Res> {
  __$$HomeModalStateFailureImplCopyWithImpl(_$HomeModalStateFailureImpl _value,
      $Res Function(_$HomeModalStateFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeModalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$HomeModalStateFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeModalStateFailureImpl implements HomeModalStateFailure {
  const _$HomeModalStateFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'HomeModalState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeModalStateFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of HomeModalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeModalStateFailureImplCopyWith<_$HomeModalStateFailureImpl>
      get copyWith => __$$HomeModalStateFailureImplCopyWithImpl<
          _$HomeModalStateFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String address) initial,
    required TResult Function() loading,
    required TResult Function() saved,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String address)? initial,
    TResult? Function()? loading,
    TResult? Function()? saved,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String address)? initial,
    TResult Function()? loading,
    TResult Function()? saved,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeModalStateInitial value) initial,
    required TResult Function(HomeModalStateLoading value) loading,
    required TResult Function(HomeModalStateSaved value) saved,
    required TResult Function(HomeModalStateFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeModalStateInitial value)? initial,
    TResult? Function(HomeModalStateLoading value)? loading,
    TResult? Function(HomeModalStateSaved value)? saved,
    TResult? Function(HomeModalStateFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeModalStateInitial value)? initial,
    TResult Function(HomeModalStateLoading value)? loading,
    TResult Function(HomeModalStateSaved value)? saved,
    TResult Function(HomeModalStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class HomeModalStateFailure implements HomeModalState {
  const factory HomeModalStateFailure({required final String message}) =
      _$HomeModalStateFailureImpl;

  String get message;

  /// Create a copy of HomeModalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeModalStateFailureImplCopyWith<_$HomeModalStateFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
