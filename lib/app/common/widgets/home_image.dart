import 'package:flutter/widgets.dart';
import 'package:home_asset_management_app/app/ui/ui.dart';

/// {@template HomeImage}
/// Displays the image of the home when [imageUrl] has a value,
/// otherwise it displays a default image.
/// {@endtemplate}
class HomeImage extends StatelessWidget {
  /// {@macro HomeImage}
  const HomeImage({super.key, this.imageUrl, this.width = 150});

  /// Image to display.
  final String? imageUrl;

  final double width;

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.space16),
        child: Image.network(imageUrl!, height: AppSpacing.space100),
      );
    }

    return Image.asset('assets/images/default_home.png', width: width);
  }
}
