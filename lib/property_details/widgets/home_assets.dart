import 'package:flutter/material.dart';
import 'package:home_asset_management_app/app/ui/app_spacing.dart';
import 'package:home_asset_management_app/property_details/providers/pods.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// {@template HomeAssets}
/// Shows the list of available assets for the home
/// {@endtemplate}
class HomeAssets extends ConsumerWidget {
  /// {@macro HomeAssets}
  const HomeAssets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(homeDetailNotifierPod).assets;
    final homeDetailNotifier = ref.read(homeDetailNotifierPod.notifier);

    return assets.when(
      data:
          (assets) => SliverList.builder(
            itemCount: assets.length,
            itemBuilder: (context, index) {
              final asset = assets[index];

              return ListTile(
                title: Text(asset.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => homeDetailNotifier.removeAsset(asset),
                      icon: const Icon(Icons.remove),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.space12,
                      ),
                      child: Text(asset.quantity.toString()),
                    ),
                    IconButton(
                      onPressed: () => homeDetailNotifier.addAsset(asset),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              );
            },
          ),
      error:
          (e, _) =>
              SliverToBoxAdapter(child: Center(child: Text(e.toString()))),
      loading:
          () => const SliverToBoxAdapter(
            child: CircularProgressIndicator.adaptive(),
          ),
    );
  }
}
