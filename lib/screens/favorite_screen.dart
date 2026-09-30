import 'package:flutter/material.dart';
import 'package:genshin_restaurant_app/data/dummy_data.dart';
import 'package:genshin_restaurant_app/screens/detail_screen.dart';
import 'package:genshin_restaurant_app/state/favorites_controller.dart';
import 'package:genshin_restaurant_app/theme/app_theme.dart';
import 'package:genshin_restaurant_app/widgets/dish_card.dart';
import 'package:genshin_restaurant_app/widgets/empty_favorite_state.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Text('Favorites', style: AppTheme.display(fontSize: 24)),
          ),
          Expanded(
            child: ValueListenableBuilder<Set<String>>(
              valueListenable: FavoritesController.instance,
              builder: (context, favoriteIds, _) {
                final favoriteDishes = dummyDishes
                    .where((dish) => favoriteIds.contains(dish.id))
                    .toList();

                if (favoriteDishes.isEmpty) {
                  return EmptyFavoriteState();
                }

                return GridView.builder(
                  padding: EdgeInsets.fromLTRB(20, 4, 20, 100),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.72,
                  ),
                  itemCount: favoriteDishes.length,
                  itemBuilder: (context, index) {
                    final dish = favoriteDishes[index];
                    return DishCard(
                      dish: dish,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DetailScreen(dish: dish),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}