import 'package:flutter/material.dart';
import 'package:home_asset_management_app/app/common/widgets/home_image.dart';
import 'package:home_asset_management_app/app/ui/ui.dart';
import 'package:homes_repository/homes_repository.dart';

/// {@template PropertyCard}
/// Card to show the property information details
/// {@endtemplate}
class PropertyCard extends StatelessWidget {
  /// {@macro PropertyCard}
  const PropertyCard({required this.home, super.key});

  /// The home to show the details
  final Home home;

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
                Hero(
                  tag: home.id,
                  child: HomeImage(
                    imageUrl: home.imageUrl,
                    width: double.infinity,
                  ),
                ),
                Text(home.name, style: textTheme.headlineMedium),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColors.secondaryColor,
                    ),
                    Text(home.address, style: textTheme.bodyLarge),
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
