import 'package:flutter/material.dart';
import 'package:genshin_restaurant_app/data/dummy_data.dart';
import 'package:genshin_restaurant_app/models/dish.dart';
import 'package:genshin_restaurant_app/screens/detail_screen.dart';
import 'package:genshin_restaurant_app/widgets/dish_card.dart';
import 'package:genshin_restaurant_app/widgets/home_content_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Mondstadt',
    'Liyue',
    'Inazuma',
    'Fontaine',
    'Sumeru',
    'Natlan',
    'Nod Krai',
  ];

  List<Dish> get _filteredDishes {
    return dummyDishes.where((dish) {
      final matchesQuery =
          dish.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCat =
          _selectedCategory == 'All' || dish.category == _selectedCategory;
      return matchesQuery && matchesCat;
    }).toList();
  }

  void _openDetail(Dish dish) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DetailScreen(dish: dish)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dishes = _filteredDishes;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HomeContentHeader(
            categories: _categories,
            selectedCategory: _selectedCategory,
            onCategorySelected: (cat) => setState(() => _selectedCategory = cat),
            onQueryChanged: (q) => setState(() => _searchQuery = q),
          ),
        ),
        if (dishes.isEmpty)
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                'No Dishes Found',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.72,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => DishCard(
                  dish: dishes[index],
                  onTap: () => _openDetail(dishes[index]),
                ),
                childCount: dishes.length,
              ),
            ),
          ),
      ],
    );
  }
}