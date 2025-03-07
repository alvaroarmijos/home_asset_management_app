import 'package:flutter/material.dart';
import 'package:home_asset_management_app/app/ui/app_colors.dart';
import 'package:home_asset_management_app/app/ui/app_spacing.dart';
import 'package:home_asset_management_app/property_details/view/property_details_page.dart';

/// {@template PropertyItem}
/// Card to show the property information in Home Page
/// {@endtemplate}
class PropertyItem extends StatelessWidget {
  /// {@macro PropertyItem}
  const PropertyItem({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PropertyDetailsPage()),
          ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSpacing.space16),
                child: Image.network(
                  'https://resource.rentcafe.com/image/upload/q_auto,f_auto/s3/2/5963/small%20duo%20exterior-1.jpg',
                  height: AppSpacing.space100,
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: AppSpacing.space16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dup Apartment', style: textTheme.titleLarge),
                      const SizedBox(height: AppSpacing.space16),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.secondaryColor,
                          ),
                          Text('US Address', style: textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
