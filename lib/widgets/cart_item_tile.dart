import 'package:flutter/material.dart';
import 'package:genshin_restaurant_app/screens/detail_screen.dart';
import 'package:genshin_restaurant_app/state/cart_controller.dart';
import 'package:genshin_restaurant_app/theme/app_theme.dart';
import 'package:genshin_restaurant_app/widgets/dish_image.dart';

class CartItemTile extends StatelessWidget {
  final dynamic item;

  const CartItemTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final dish = item.dish;

    return Container(
      padding:  EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset:  Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DetailScreen(dish: dish),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: 72,
                height: 72,
                color:  Color(0xFFFBF7F5),
                child: DishNetworkImage(
                  imageUrl: dish.imageUrl,
                  fallbackIcon: dish.icon,
                  fallbackColor: dish.color,
                ),
              ),
            ),
          ),
           SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryLight.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${dish.category} Dish',
                    style:  TextStyle(
                      color: AppTheme.primaryDark,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                 SizedBox(height: 4),
                Text(
                  dish.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                  ),
                ),
                 SizedBox(height: 6),
                Text(
                  formatRupiah(item.totalPrice),
                  style:  TextStyle(
                    color: AppTheme.primaryDark,
                    fontWeight: FontWeight.w800,
                    fontSize: 13.5,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    CartController.instance.updateQuantity(
                      dish.id,
                      item.quantity - 1,
                    );
                  },
                  child:  Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.remove, size: 14),
                  ),
                ),
                Text(
                  '${item.quantity}',
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    CartController.instance.updateQuantity(
                      dish.id,
                      item.quantity + 1,
                    );
                  },
                  child:  Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.add, size: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}