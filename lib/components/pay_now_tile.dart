import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop/constants/pallete.dart';
import 'package:sushi_shop/models/food_cart.dart';

class PayNowTile extends StatelessWidget {
  const PayNowTile({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPrice = context.watch<FoodCart>().calculateTotalPrice();
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: secondary, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Total price\n',
                style: TextStyle(color: Colors.grey[100], fontSize: 18),
              ),
              TextSpan(
                  text: '\$$totalPrice',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
            ])),

            //pay
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8)),
              child: const Row(
                children: [
                  Text(
                    'Pay now',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
