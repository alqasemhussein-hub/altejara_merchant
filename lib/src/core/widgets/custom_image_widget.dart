import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;
  final Widget? errorWidget;

  const CustomImageWidget({
    super.key,
    required this.imageUrl,
    this.width = double.infinity,
    this.height = 200,
    this.borderRadius = 12,
    this.fit = BoxFit.cover,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurfaceVariant;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => Container(
          color: Colors.grey.shade200,
          alignment: Alignment.center,
          child: Icon(
            PhosphorIcons.image(PhosphorIconsStyle.bold),
            size: 40,
            color: Colors.grey,
          ),
        ),
        errorWidget: (context, url, error) =>
            errorWidget ??
            Container(
              color: Colors.grey.shade100,
              alignment: Alignment.center,
              child: Icon(
                PhosphorIcons.warningCircle(PhosphorIconsStyle.bold),
                size: 36,
                color: Colors.redAccent,
              ),
            ),
      ),
    );
  }
}
