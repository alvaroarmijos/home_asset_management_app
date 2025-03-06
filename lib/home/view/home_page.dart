import 'package:flutter/material.dart';
import 'package:home_asset_management_app/app/ui/app_spacing.dart';
import 'package:home_asset_management_app/home/widgets/widgets.dart';

/// {@template HomePage}
/// Home page view
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro HomePage}
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello!', style: textTheme.headlineLarge),
        centerTitle: false,
        actions: const [
          CircleAvatar(
            minRadius: AppSpacing.space32,
            foregroundImage: NetworkImage(
              'https://img.freepik.com/psd-gratis/ilustracion-3d-avatar-linea_23-2151303048.jpg',
            ),
          ),
        ],
      ),
      body: const Column(children: [HomeProperties()]),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
