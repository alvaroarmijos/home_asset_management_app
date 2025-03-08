import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_asset_management_app/app/common/widgets/home_modal.dart';
import 'package:home_asset_management_app/app/ui/app_spacing.dart';
import 'package:home_asset_management_app/home/state/pods.dart';
import 'package:home_asset_management_app/home/widgets/home_properties.dart';

/// {@template HomePage}
/// Home page view
/// {@endtemplate}
class HomePage extends ConsumerWidget {
  /// {@macro HomePage}
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final homeState = ref.watch(homeNotifierPod);

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
      body: homeState.when(
        data: (homes) => HomeProperties(homes: homes),
        error: (e, _) => Center(child: Text(e.toString())),
        loading:
            () => const Center(child: CircularProgressIndicator.adaptive()),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed:
            () => showModalBottomSheet<void>(
              context: context,
              showDragHandle: true,
              isScrollControlled: true,
              builder: (context) => const HomeModal(),
            ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
