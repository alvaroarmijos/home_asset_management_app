import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_asset_management_app/app/ui/app_spacing.dart';
import 'package:home_asset_management_app/home/providers/pods.dart';
import 'package:home_asset_management_app/property_details/providers/pods.dart';
import 'package:home_asset_management_app/property_details/widgets/home_assets.dart';
import 'package:home_asset_management_app/property_details/widgets/pop_up_menu_details.dart';
import 'package:home_asset_management_app/property_details/widgets/property_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// {@template HomePage}
/// Property details view
/// {@endtemplate}
class PropertyDetailsPage extends HookConsumerWidget {
  /// {@macro HomePage}
  const PropertyDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final homeId = ModalRoute.of(context)!.settings.arguments! as String;

    // Listening for changes in deleteHomeNotifierPod to navigate back
    ref.listen(deleteHomeNotifierPod, (_, next) {
      // Pop the Property Detail Page when the user deletes the Home
      if (next.hasValue) {
        Navigator.pop(context);
      }
    });

    useEffect(() {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ref.read(homeDetailNotifierPod.notifier).listenHomeChanges(homeId);
      });
      return null;
    }, []);

    final homeDetailState = ref.watch(homeDetailNotifierPod);

    return homeDetailState.home.when(
      data:
          (home) => Scaffold(
            appBar: AppBar(
              title: const Text('Property Details'),
              actions: [PopUpMenuDetails(home: home)],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.space16,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: CustomScrollView(
                    slivers: [
                      PropertyCard(home: home),
                      SliverToBoxAdapter(
                        child: Text('Assets', style: textTheme.titleLarge),
                      ),
                      const HomeAssets(),
                    ],
                  ),
                ),
              ),
            ),
          ),
      loading:
          () => const Scaffold(
            body: Center(child: CircularProgressIndicator.adaptive()),
          ),
      error:
          (error, _) => Scaffold(body: Center(child: Text(error.toString()))),
    );
  }
}
