import 'package:flutter/material.dart';
import 'package:genshin_restaurant_app/models/dish.dart';
import 'package:genshin_restaurant_app/theme/app_theme.dart';

class ProductSummary extends StatelessWidget {
  const ProductSummary({super.key, required this.dish});

  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.primaryLight.withValues(alpha:0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${dish.category} Dish',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryDark,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                dish.name,
                style: AppTheme.display(fontSize: 22),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primaryLight.withValues(alpha:0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(Icons.star_rounded, size: 16, color: AppTheme.primary),
              SizedBox(width: 4),
              Text(
                '${dish.rating}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}