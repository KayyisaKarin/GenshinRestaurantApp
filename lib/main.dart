import 'package:genshin_restaurant_app/screens/splash_screen.dart';
import 'package:genshin_restaurant_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GenshinRestaurantApp());
}

class GenshinRestaurantApp extends StatelessWidget {
  const GenshinRestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "genshin_restaurant App",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: SplashScreen(),
    );
  }
}
