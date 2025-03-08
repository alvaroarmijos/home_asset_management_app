// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_modal.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeModalState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeModalState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeModalState()';
}


}

/// @nodoc
class $HomeModalStateCopyWith<$Res>  {
$HomeModalStateCopyWith(HomeModalState _, $Res Function(HomeModalState) __);
}


/// @nodoc


class HomeModalStateInitial implements HomeModalState {
  const HomeModalStateInitial({this.name = '', this.address = ''});
  

@JsonKey() final  String name;
@JsonKey() final  String address;

/// Create a copy of HomeModalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeModalStateInitialCopyWith<HomeModalStateInitial> get copyWith => _$HomeModalStateInitialCopyWithImpl<HomeModalStateInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeModalStateInitial&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,name,address);

@override
String toString() {
  return 'HomeModalState.initial(name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class $HomeModalStateInitialCopyWith<$Res> implements $HomeModalStateCopyWith<$Res> {
  factory $HomeModalStateInitialCopyWith(HomeModalStateInitial value, $Res Function(HomeModalStateInitial) _then) = _$HomeModalStateInitialCopyWithImpl;
@useResult
$Res call({
 String name, String address
});




}
/// @nodoc
class _$HomeModalStateInitialCopyWithImpl<$Res>
    implements $HomeModalStateInitialCopyWith<$Res> {
  _$HomeModalStateInitialCopyWithImpl(this._self, this._then);

  final HomeModalStateInitial _self;
  final $Res Function(HomeModalStateInitial) _then;

/// Create a copy of HomeModalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? address = null,}) {
  return _then(HomeModalStateInitial(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class HomeModalStateLoading implements HomeModalState {
  const HomeModalStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeModalStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeModalState.loading()';
}


}




/// @nodoc


class HomeModalStateSaved implements HomeModalState {
  const HomeModalStateSaved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeModalStateSaved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeModalState.saved()';
}


}




/// @nodoc


class HomeModalStateFailure implements HomeModalState {
  const HomeModalStateFailure({required this.message});
  

 final  String message;

/// Create a copy of HomeModalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeModalStateFailureCopyWith<HomeModalStateFailure> get copyWith => _$HomeModalStateFailureCopyWithImpl<HomeModalStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeModalStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeModalState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $HomeModalStateFailureCopyWith<$Res> implements $HomeModalStateCopyWith<$Res> {
  factory $HomeModalStateFailureCopyWith(HomeModalStateFailure value, $Res Function(HomeModalStateFailure) _then) = _$HomeModalStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$HomeModalStateFailureCopyWithImpl<$Res>
    implements $HomeModalStateFailureCopyWith<$Res> {
  _$HomeModalStateFailureCopyWithImpl(this._self, this._then);

  final HomeModalStateFailure _self;
  final $Res Function(HomeModalStateFailure) _then;

/// Create a copy of HomeModalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(HomeModalStateFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
