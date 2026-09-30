import 'package:flutter/material.dart';

class DishNetworkImage extends StatelessWidget {
  const DishNetworkImage({
    super.key,
    required this.imageUrl,
    required this.fallbackIcon,
    required this.fallbackColor,
  });

  final String imageUrl;
  final IconData fallbackIcon;
  final Color fallbackColor;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return _buildFallback();
    }

    return Image.network(
      imageUrl,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => _buildFallback(),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }

  Widget _buildFallback() {
    return Container(
      color: fallbackColor.withValues(alpha: 0.15),
      child: Center(
        child: Icon(fallbackIcon, size: 48, color: fallbackColor),
      ),
    );
  }
}