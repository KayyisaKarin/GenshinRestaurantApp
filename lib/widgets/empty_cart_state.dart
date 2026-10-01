import 'package:flutter/material.dart';
import 'package:genshin_restaurant_app/theme/app_theme.dart';

class EmptyCartState extends StatelessWidget {
  const EmptyCartState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppTheme.primaryLight.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child:  Icon(
              Icons.shopping_bag_outlined,
              size: 40,
              color: AppTheme.primary,
            ),
          ),
           SizedBox(height: 16),
           Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Explore Teyvat delicacies and add them to your cart!',
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}