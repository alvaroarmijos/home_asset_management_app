import 'package:assets_repository/assets_repository.dart';
import 'package:homes_repository/homes_repository.dart';

class TestData {
  static final home = Home(
    id: 'homeId1',
    name: 'Property1',
    address: 'Address1',
  );
  static final home2 = Home(
    id: 'homeId2',
    name: 'Property2',
    address: 'Address2',
  );
  static final userHomes = [home, home2];
  static final homeAsset = Asset(
    id: '1',
    name: 'Refrigerator',
    homeId: '',
    quantity: 0,
  );
  static final availableAssets = [
    Asset(id: '1', name: 'Refrigerator', homeId: '', quantity: 0),
    Asset(id: '2', name: 'Microwave', homeId: '', quantity: 0),
    Asset(id: '3', name: 'Dishwasher', homeId: '', quantity: 0),
  ];
}
