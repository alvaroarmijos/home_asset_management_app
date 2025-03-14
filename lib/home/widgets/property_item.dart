import 'package:flutter/material.dart';
import 'package:home_asset_management_app/app/common/widgets/home_image.dart';
import 'package:home_asset_management_app/app/navigator/app_navigator.dart';
import 'package:home_asset_management_app/app/ui/app_colors.dart';
import 'package:home_asset_management_app/app/ui/app_spacing.dart';
import 'package:homes_repository/homes_repository.dart';

/// {@template PropertyItem}
/// Card to show the property information in Home Page
/// {@endtemplate}
class PropertyItem extends StatelessWidget {
  /// {@macro PropertyItem}
  const PropertyItem({required this.home, super.key});

  /// The home to show the details
  final Home home;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => AppNavigator.navigateToPropertyDetail(context, home.id),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space8),
          child: Row(
            children: [
              Hero(tag: home.id, child: const HomeImage()),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: AppSpacing.space16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(home.name, style: textTheme.titleLarge),
                      const SizedBox(height: AppSpacing.space16),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.secondaryColor,
                          ),
                          Text(home.address, style: textTheme.bodySmall),
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
