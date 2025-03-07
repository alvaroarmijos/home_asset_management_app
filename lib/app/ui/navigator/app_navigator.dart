// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';

/// Abstract class of Navigator.
abstract class AppNavigator {
  /// main route
  static const MAIN_ROUTE = Navigator.defaultRouteName;

  /// property detail route
  static const PROPERTY_DETAIL = '/detail';

  /// navigate to the property detail page
  static void navigateToPropertyDetail(BuildContext context) {
    Navigator.pushNamed(context, PROPERTY_DETAIL);
  }
}
