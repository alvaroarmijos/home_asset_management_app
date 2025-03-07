import 'package:flutter/material.dart';
import 'package:home_asset_management_app/app/ui/app_spacing.dart';
import 'package:home_asset_management_app/property_details/widgets/property_card.dart';

/// {@template HomePage}
/// Property details view
/// {@endtemplate}
class PropertyDetailsPage extends StatelessWidget {
  /// {@macro HomePage}
  const PropertyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Property Details'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
        child: CustomScrollView(
          slivers: [
            const PropertyCard(),
            SliverToBoxAdapter(
              child: Text('Assets', style: textTheme.titleLarge),
            ),
          ],
        ),
      ),
    );
  }
}
