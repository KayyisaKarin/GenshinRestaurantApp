import 'package:flutter/material.dart';

class PromoBanner {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String? bgImageUrl;
  final List<Color> gradientColors;

  PromoBanner({required this.title, required this.subtitle, required this.imageUrl, required this.gradientColors, this.bgImageUrl});
}