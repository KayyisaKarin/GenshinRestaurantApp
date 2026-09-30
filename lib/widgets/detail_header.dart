import 'package:flutter/material.dart';
import 'package:genshin_restaurant_app/models/dish.dart';
import 'package:genshin_restaurant_app/state/favorites_controller.dart';
import 'package:genshin_restaurant_app/theme/app_theme.dart';
import 'package:genshin_restaurant_app/widgets/circle_icon_button.dart';
import 'package:genshin_restaurant_app/widgets/dish_image.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key, required this.dish, required this.onBack});

  final Dish dish;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      width: double.infinity,
      color: AppTheme.primaryLight.withValues(alpha: 0.25),
      child: Stack(
        children: [
          Center(
            child: Hero(
              tag: 'dish-image-${dish.id}',
              child: DishNetworkImage(
                imageUrl: dish.imageUrl,
                fallbackIcon: dish.icon,
                fallbackColor: dish.color,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButton(icon: Icons.arrow_back, onTap: onBack),
                  ValueListenableBuilder<Set<String>>(
                    valueListenable: FavoritesController.instance,
                    builder: (context, favorites, _) {
                      final isFav = favorites.contains(dish.id);
                      return CircleIconButton(
                        icon: isFav ? Icons.favorite : Icons.favorite_border,
                        iconColor: isFav
                            ? AppTheme.primary
                            : AppTheme.textPrimary,
                        onTap: () =>
                            FavoritesController.instance.toggle(dish.id),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
