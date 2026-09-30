import 'package:flutter/material.dart';
import '../models/dish.dart';

class CartItem {
  final Dish dish;
  int quantity;

  CartItem({required this.dish, this.quantity = 1});

  double get totalPrice => dish.price * quantity;
}

class CartController extends ChangeNotifier {
  CartController._();
  static final CartController instance = CartController._();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get totalCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.fold(0.0, (sum, item) => sum + item.totalPrice);

  void addToCart(Dish dish, [int quantity = 1]) {
    if (quantity <= 0) return;
    final index = _items.indexWhere((item) => item.dish.id == dish.id);
    if (index >= 0) {
      _items[index].quantity += quantity;
    } else {
      _items.add(CartItem(dish: dish, quantity: quantity));
    }
    notifyListeners();
  }

  void updateQuantity(String dishId, int quantity) {
    if (quantity <= 0) {
      _items.removeWhere((item) => item.dish.id == dishId);
    } else {
      final index = _items.indexWhere((item) => item.dish.id == dishId);
      if (index >= 0) {
        _items[index].quantity = quantity;
      }
    }
    notifyListeners();
  }

  void removeItem(String dishId) {
    _items.removeWhere((item) => item.dish.id == dishId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}