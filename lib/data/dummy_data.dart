import 'package:flutter/material.dart';
import '../models/dish.dart';
import '../models/promo_banner.dart';

class DummyUser {
  static String email = 'demo@genshinrestaurant.com';
  static String password = 'genshin123';
  static String name = 'Traveler';
}

final List<Dish> dummyDishes = [
  // Mondstadt (2 dishes)
  Dish(
    id: 'd1',
    name: 'Puppy-Paw Hash Brown',
    category: 'Mondstadt',
    price: 42000,
    rating: 4.9,
    description: "Razor's specialty dish. Carefully molded into the shape of a wolf's paw. Each crispy, golden bite is savory, tender, and filled with rustic love.",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/0/0d/Item_Puppy-Paw_Hash_Brown.png/revision/latest?cb=20201210060857',
    icon: Icons.restaurant,
    color: Colors.amber.shade300,
  ),
  Dish(
    id: 'd2',
    name: "Outrider's Champion Steak!",
    category: 'Mondstadt',
    price: 38000,
    rating: 4.7,
    description: "Amber's specialty dish. One side is lightly charred, but the inside remains tender and juicy. The sheer enthusiasm poured into it makes it a champion's feast.",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/9/95/Item_Outrider%27s_Champion_Steak%21.png/revision/latest?cb=20201210061922',
    icon: Icons.restaurant,
    color: Colors.red.shade300,
  ),

  // Liyue (2 dishes)
  Dish(
    id: 'd3',
    name: "Rockin' Riffin' Chicken!",
    category: 'Liyue',
    price: 45000,
    rating: 4.8,
    description: "Xinyan's specialty dish. Its demonic appearance hides an explosive, fiery, and deeply musical flavor. Tear right in, and the spicy kick will have you rockin' out!",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/d/dc/Item_Rockin%27_Riffin%27_Chicken%21.png/revision/latest?cb=20201210062950',
    icon: Icons.restaurant,
    color: Colors.deepOrange.shade300,
  ),
  Dish(
    id: 'd4',
    name: 'Slow-Cooked Bamboo Shoot Soup',
    category: 'Liyue',
    price: 85000,
    rating: 4.9,
    description: "Zhongli's specialty dish. Cured pork belly and savory ham slowly simmered for hours with crisp mountain bamboo shoots until the ivory broth is pure serenity.",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/6/6e/Item_Slow-Cooked_Bamboo_Shoot_Soup.png/revision/latest?cb=20201210062930',
    icon: Icons.ramen_dining,
    color: Colors.amber.shade200,
  ),

  // Inazuma (2 dishes)
  Dish(
    id: 'd5',
    name: 'Snow on the Hearth',
    category: 'Inazuma',
    price: 52000,
    rating: 4.9,
    description: "Kamisato Ayaka's specialty dish. An exquisite, snow-white mochi wagashi filled with sweet red bean paste and tenderly wrapped in a salted sakura leaf.",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/d/d8/Item_%22Snow_on_the_Hearth%22.png/revision/latest?cb=20210723015844',
    icon: Icons.bakery_dining,
    color: Colors.purple.shade200,
  ),
  Dish(
    id: 'd6',
    name: 'Way of the Strong',
    category: 'Inazuma',
    price: 54000,
    rating: 4.9,
    description: "Arataki Itto's specialty dish. Piled impossibly high with sizzling savory noodles and glistening sauce. Itto proudly declares: 'A real man eats until he's completely stuffed!'",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/1/1c/Item_Way_of_the_Strong.png/revision/latest?cb=20211124040557',
    icon: Icons.dinner_dining,
    color: Colors.red.shade400,
  ),

  // Sumeru (2 dishes)
  Dish(
    id: 'd7',
    name: 'Halvamazd',
    category: 'Sumeru',
    price: 58000,
    rating: 5.0,
    description: "Nahida's specialty dish. Candied Ajilenakh nuts crushed into fragrant, velvety halva and sculpted like tender green leaves, bestowing tranquil wisdom upon the palate.",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/0/0e/Item_Halvamazd.png/revision/latest?cb=20221102101937',
    icon: Icons.eco,
    color: Colors.green.shade300,
  ),
  Dish(
    id: 'd7_2',
    name: 'Surveyor’s Chilled Stew',
    category: 'Sumeru',
    price: 49000,
    rating: 4.8,
    description: "Tighnari's specialty dish. Carefully chosen forest mushrooms tossed with wild spices and cooling mountain herbs, providing refreshing vitality for long woodland patrols.",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/c/c3/Item_Forest_Watcher%27s_Choice.png/revision/latest?cb=20220824050119',
    icon: Icons.soup_kitchen,
    color: Colors.teal.shade300,
  ),

  // Fontaine (2 dishes)
  Dish(
    id: 'd8',
    name: 'Pour la Justice',
    category: 'Fontaine',
    price: 95000,
    rating: 4.9,
    description: "Furina's specialty dish. An opulent multi-layered French entremet cake with airy berry mousse, almond biscuit, and a glistening mirror glaze fit for the Opera Epiclese.",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/8/87/Item_%22Pour_la_Justice%22.png/revision/latest?cb=20231108034627',
    icon: Icons.cake,
    color: Colors.blue.shade300,
  ),
  Dish(
    id: 'd8_2',
    name: 'Secret Sauce BBQ Ribs',
    category: 'Fontaine',
    price: 88000,
    rating: 4.9,
    description: "Navia's specialty dish. Slow-roasted tender Fontainian ribs basted in sweet, tangy caramelized berry glaze and decorated with sun-golden ribbons.",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/e/e8/Item_%22Pick_What_You_Like%21%22.png/revision/latest?cb=20231220072016',
    icon: Icons.restaurant,
    color: Colors.amber.shade400,
  ),

  // Natlan (2 dishes)
  Dish(
    id: 'd9',
    name: 'Impeccably Organized',
    category: 'Natlan',
    price: 46000,
    rating: 4.8,
    description: "Kachina's specialty dish. Hearty Grainfruit and seasoned meats neatly packed with tender care into a colorful, energetic bento box for young adventurers.",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/0/06/Item_Impeccably_Organized.png/revision/latest?cb=20240828173142',
    icon: Icons.lunch_dining,
    color: Colors.orange.shade300,
  ),
  Dish(
    id: 'd9_2',
    name: 'Hot Spring Fried Meat Tart',
    category: 'Natlan',
    price: 54000,
    rating: 4.9,
    description: "Mualani's specialty dish. Flaky volcano crust stuffed with sizzling Saurian-seasoned meats and bubbling golden cheese, capturing the zest of People of the Springs.",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/f/f6/Item_Pass_the_Luck.png/revision/latest?cb=20240828173200',
    icon: Icons.local_fire_department,
    color: Colors.deepOrange.shade400,
  ),

  // Nod Krai (2 dishes)
  Dish(
    id: 'd10',
    name: 'Clink-Clank Confectionery Cup',
    category: 'Nod Krai',
    price: 62000,
    rating: 4.9,
    description: "Aino's specialty dish. An irresistibly sweet festive dessert cup piled high with whipped berry cream, amber honey drizzle, and crispy rolled krumkake wafers.",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/6/60/Item_Clink-Clank_Confectionery_Cup.png/revision/latest?cb=20250910090825',
    icon: Icons.icecream,
    color: Colors.pink.shade300,
  ),
  Dish(
    id: 'd10_2',
    name: 'Northern Aurora Berry Tarts',
    category: 'Nod Krai',
    price: 68000,
    rating: 5.0,
    description: "Traditional northern frosted berry tarts infused with glacier sugar crystals, glowing with vivid aurora hues and delivering a crisp winter sweetness.",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/7/77/Item_Invigorating_Kitty_Meal.png/revision/latest?cb=20210901083439',
    icon: Icons.star,
    color: Colors.cyan.shade300,
  ),
];

final List<PromoBanner> dummyBanners = [
  PromoBanner(
    title: 'Inazuma Feast Festival',
    subtitle: "Savor Itto's sizzling Way of the Strong soba noodles",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/1/1c/Item_Way_of_the_Strong.png/revision/latest?cb=20211124040557',
    gradientColors: [Color(0xFF5E2750), Color(0xFF2F122B)],
  ),
  PromoBanner(
    title: 'Liyue Harbor Gourmet Gala',
    subtitle: "Fiery Rockin' Riffin' Chicken & Slow-Cooked Soup",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/d/dc/Item_Rockin%27_Riffin%27_Chicken%21.png/revision/latest?cb=20201210062950',
    gradientColors: [Color(0xFF8C3B14), Color(0xFF381608)],
  ),
  PromoBanner(
    title: 'Court of Fontaine Delicacies',
    subtitle: "Exquisite Pour la Justice Berry Mousse & Ribs",
    imageUrl: 'https://static.wikia.nocookie.net/gensin-impact/images/8/87/Item_%22Pour_la_Justice%22.png/revision/latest?cb=20231108034627',
    gradientColors:  [Color(0xFF1A4B75), Color(0xFF0E243A)],
  ),
];