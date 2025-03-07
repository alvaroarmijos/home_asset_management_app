import 'package:flutter/material.dart';
import 'package:home_asset_management_app/app/ui/ui.dart';
import 'package:home_asset_management_app/home/widgets/property_item.dart';
import 'package:homes_repository/homes_repository.dart';

/// {@template HomeProperties}
/// Show the list of user's properties
/// {@endtemplate}
class HomeProperties extends StatelessWidget {
  /// {@macro HomeProperties}
  const HomeProperties({required this.homes, super.key});

  /// List of User's homes
  final List<Home> homes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Expanded(
      child: CustomScrollView(
        slivers: [
          PinnedHeaderSliver(
            child: DecoratedBox(
              decoration: BoxDecoration(color: theme.colorScheme.surface),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.space16),
                child: Text('My Properties', style: textTheme.headlineSmall),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ...homes.map((home) => PropertyItem(home: home)),
            ]),
          ),
        ],
      ),
    );
  }
}
