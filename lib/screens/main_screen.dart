import 'package:flutter/material.dart';
import 'package:genshin_restaurant_app/screens/favorite_screen.dart';
import 'package:genshin_restaurant_app/screens/home_screen.dart';
import 'package:genshin_restaurant_app/screens/cart_screen.dart';
import 'package:genshin_restaurant_app/state/cart_controller.dart';
import 'package:genshin_restaurant_app/widgets/bottom_nav_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const _screens = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.fromLTRB(20, 0, 20, 16),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: BottomNavItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  selected: _selectedIndex == 0,
                  onTap: () => setState(() => _selectedIndex = 0),
                ),
              ),
              Expanded(
                child: BottomNavItem(
                  icon: Icons.favorite_rounded,
                  label: 'Favorite',
                  selected: _selectedIndex == 1,
                  onTap: () => setState(() => _selectedIndex = 1),
                ),
              ),
              Expanded(
                child: AnimatedBuilder(
                  animation: CartController.instance,
                  builder: (context, _) {
                    return BottomNavItem(
                      icon: Icons.shopping_bag_rounded,
                      label: 'Cart',
                      badgeCount: CartController.instance.totalCount,
                      selected: _selectedIndex == 2,
                      onTap: () => setState(() => _selectedIndex = 2),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}