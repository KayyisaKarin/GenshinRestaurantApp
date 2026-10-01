import 'package:flutter/material.dart';
import 'package:genshin_restaurant_app/state/cart_controller.dart';
import 'package:genshin_restaurant_app/theme/app_theme.dart';

class CartSummaryBottomSheet extends StatelessWidget {
  final int totalCount;
  final double totalPrice;

   const CartSummaryBottomSheet({
    super.key,
    required this.totalCount,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset:  Offset(0, -4),
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
                Text('Subtotal ($totalCount items)', style:  TextStyle(fontSize: 13, color: Colors.grey)),
                Text(formatRupiah(totalPrice), style:  TextStyle(fontWeight: FontWeight.w600)),
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
                  style:  TextStyle(
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
                child:  Text(
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
    );
  }
}