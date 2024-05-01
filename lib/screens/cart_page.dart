import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop/components/pay_now_tile.dart';
import 'package:sushi_shop/constants/pallete.dart';
import 'package:sushi_shop/models/food.dart';

import '../models/food_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static String routeName = '/ cart_page';

  void deleteFromCart(Food food, BuildContext context) {
    final foodCart = context.read<FoodCart>();
    //remove from cart
    foodCart.deleteFromCart(food);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${food.name} deleted',
        ),
        backgroundColor: secondary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final foodCart = context.watch<FoodCart>().foodCart;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Cart'),
        backgroundColor: primary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: foodCart.length,
                itemBuilder: (context, index) {
                  //get food from cart
                  final Food food = foodCart[index];

                  //get food name
                  final String foodName = food.name;

                  //get food price
                  final double foodPrice = food.price;

                  //get food quantity
                  final int foodQuantity = food.quantity;

                  //return list tile
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.startToEnd,
                    background: Container(
                      color: secondary,
                      margin: const EdgeInsets.symmetric(horizontal: 20)
                          .copyWith(top: 15),
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.delete_forever,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    onDismissed: (direction) {
                      deleteFromCart(food, context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(8)),
                      margin: const EdgeInsets.symmetric(horizontal: 20)
                          .copyWith(top: 15),
                      child: ListTile(
                        title: Text(
                          foodName,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Quantity: ${foodQuantity.toString()}',
                                style: TextStyle(color: Colors.grey[200])),
                            Text(
                              'Price:\$ ${foodPrice.toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.grey[200]),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () => deleteFromCart(food, context),
                            icon: const Icon(Icons.delete)),
                      ),
                    ),
                  );
                }),
          ),
          const PayNowTile()
        ],
      ),
    );
  }
}
