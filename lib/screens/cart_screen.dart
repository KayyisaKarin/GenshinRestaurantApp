import 'package:flutter/material.dart';
import 'package:genshin_restaurant_app/state/cart_controller.dart';
import 'package:genshin_restaurant_app/theme/app_theme.dart';
import 'package:genshin_restaurant_app/widgets/cart_item_tile.dart';
import 'package:genshin_restaurant_app/widgets/cart_summary_bottom_sheet.dart';
import 'package:genshin_restaurant_app/widgets/empty_cart_state.dart';

class CartScreen extends StatelessWidget {
   const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Your Cart',
          style: AppTheme.display(fontSize: 22),
        ),
        actions: [
          AnimatedBuilder(
            animation: CartController.instance,
            builder: (context, _) {
              if (CartController.instance.items.isEmpty) {
                return  SizedBox.shrink();
              }
              return TextButton.icon(
                onPressed: () => CartController.instance.clearCart(),
                icon:  Icon(Icons.delete_outline, size: 18, color: AppTheme.primaryDark),
                label:  Text('Clear', style: TextStyle(color: AppTheme.primaryDark)),
              );
            },
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: CartController.instance,
        builder: (context, _) {
          final cartItems = CartController.instance.items;
          final totalCount = CartController.instance.totalCount;
          final totalPrice = CartController.instance.totalPrice;

          if (cartItems.isEmpty) {
            return  EmptyCartState();
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding:  EdgeInsets.fromLTRB(20, 10, 20, 20),
                  itemCount: cartItems.length,
                  separatorBuilder: (_, _) =>  SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    return CartItemTile(item: cartItems[index]);
                  },
                ),
              ),
              CartSummaryBottomSheet(
                totalCount: totalCount,
                totalPrice: totalPrice,
              ),
            ],
          );
        },
      ),
    );
  }
}