import 'package:assets_repository/assets_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_asset_management_app/home/providers/home_modal.state.dart';
import 'package:home_asset_management_app/home/providers/home_modal_notifier.dart';
import 'package:home_asset_management_app/home/providers/home_notifier.dart';
import 'package:home_asset_management_app/property_details/providers/home_detail.state.dart';
import 'package:home_asset_management_app/property_details/providers/home_detail_notifier.dart';
import 'package:homes_repository/homes_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepository with Mock implements HomesRepository {}

class MockAssetsRepository with Mock implements AssetsRepository {}

class MockHomeNotifier extends HomeNotifier {
  MockHomeNotifier(this.initialValue)
    : super(homesRepository: MockHomeRepository());

  final AsyncValue<List<Home>> initialValue;

  @override
  AsyncValue<List<Home>> get state => initialValue;
}

class MockHomeModalNotifier extends HomeModalNotifier {
  MockHomeModalNotifier(this.initialState)
    : super(
        homesRepository: MockHomeRepository(),
        assetsRepository: MockAssetsRepository(),
      );

  final HomeModalState initialState;

  @override
  HomeModalState get state => initialState;
}

class MockHomeDetailNotifier extends HomeDetailNotifier {
  MockHomeDetailNotifier(this.initialState)
    : super(
        homesRepository: MockHomeRepository(),
        assetsRepository: MockAssetsRepository(),
      );

  final HomeDetailState initialState;

  @override
  Stream<HomeDetailState> get stream => Stream.value(initialState);

  @override
  HomeDetailState get state => initialState;
}
