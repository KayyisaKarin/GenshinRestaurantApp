import 'package:flutter/material.dart';

class EmptyFavoriteState extends StatelessWidget {
  const EmptyFavoriteState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 64, color: Colors.grey.shade300),
          SizedBox(height: 12),
          Text(
            'No favorite dishes yet.',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          Text(
            'Click on the heart icon to add a favorite dish.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12
            ),
          )
        ],
      ),
    );
  }
}