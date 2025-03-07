import 'package:flutter/material.dart';
import 'package:home_asset_management_app/app/ui/ui.dart';

/// {@template PropertyCard}
/// Card to show the property information details
/// {@endtemplate}
class PropertyCard extends StatelessWidget {
  /// {@macro PropertyCard}
  const PropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SliverSafeArea(
      sliver: SliverToBoxAdapter(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.space16),
            child: Column(
              spacing: AppSpacing.space16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSpacing.space32),
                  child: Image.network(
                    'https://resource.rentcafe.com/image/upload/q_auto,f_auto/s3/2/5963/small%20duo%20exterior-1.jpg',
                    width: double.infinity,
                  ),
                ),
                Text('Dup Apartment', style: textTheme.headlineMedium),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColors.secondaryColor,
                    ),
                    Text('US Address', style: textTheme.bodyLarge),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
