import 'package:flutter/material.dart';
import '../screens/detail_screen.dart';
import '../state/cart_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/dish_image.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: AppTheme.display(fontSize: 22),
        ),
        actions: [
          AnimatedBuilder(
            animation: CartController.instance,
            builder: (context, _) {
              if (CartController.instance.items.isEmpty) {
                return SizedBox.shrink();
              }
              return TextButton.icon(
                onPressed: () => CartController.instance.clearCart(),
                icon: Icon(Icons.delete_outline, size: 18, color: AppTheme.primaryDark),
                label: Text('Clear', style: TextStyle(color: AppTheme.primaryDark)),
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryLight.withValues(alpha:0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
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

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  itemCount: cartItems.length,
                  separatorBuilder: (_, _) => SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    final dish = item.dish;

                    return Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade200),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => DetailScreen(dish: dish),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                width: 72,
                                height: 72,
                                color: Color(0xFFFBF7F5),
                                child: DishNetworkImage(
                                  imageUrl: dish.imageUrl,
                                  fallbackIcon: dish.icon,
                                  fallbackColor: dish.color,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: AppTheme.primaryLight.withValues(alpha:0.4),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    '${dish.category} Dish',
                                    style: TextStyle(
                                      color: AppTheme.primaryDark,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  dish.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.textPrimary,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  formatRupiah(item.totalPrice),
                                  style: TextStyle(
                                    color: AppTheme.primaryDark,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 13.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    CartController.instance.updateQuantity(
                                      dish.id,
                                      item.quantity - 1,
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Icon(Icons.remove, size: 14),
                                  ),
                                ),
                                Text(
                                  '${item.quantity}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    CartController.instance.updateQuantity(
                                      dish.id,
                                      item.quantity + 1,
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Icon(Icons.add, size: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .06),
                      blurRadius: 16,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal ($totalCount items)', style: TextStyle(fontSize: 13, color: Colors.grey)),
                          Text(formatRupiah(totalPrice), style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery Fee', style: TextStyle(fontSize: 13, color: Colors.grey)),
                          Text('Rp 0', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green)),
                        ],
                      ),
                      Divider(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Grand Total', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Text(
                            formatRupiah(totalPrice),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.primaryDark,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            CartController.instance.clearCart();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Order placed! Feast is being cooked by Xiangling.'),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}