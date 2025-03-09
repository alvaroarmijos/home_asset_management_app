import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_asset_management_app/app/di/di.dart';
import 'package:home_asset_management_app/app/ui/ui.dart';
import 'package:home_asset_management_app/home/view/home_page.dart';
import 'package:home_asset_management_app/property_details/view/property_details_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerGlobalDeps();
  await initializeDeps();
  runApp(const MyApp());
}

/// {@template MyApp}
/// Contains the Material App
/// {@endtemplate}
class MyApp extends StatelessWidget {
  /// {@macro MyApp}
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home Asset Management App',
        theme: AppTheme.lightTheme,
        routes: {
          AppNavigator.MAIN_ROUTE: (_) => const HomePage(),
          AppNavigator.PROPERTY_DETAIL: (_) => const PropertyDetailsPage(),
        },
      ),
    );
  }
}
