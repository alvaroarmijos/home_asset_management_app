import 'package:flutter/material.dart';
import 'package:home_asset_management_app/app/ui/ui.dart';
import 'package:home_asset_management_app/home/view/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Asset Management App',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
