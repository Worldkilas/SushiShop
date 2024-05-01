import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:sushi_shop/constants/pallete.dart';
import 'package:sushi_shop/constants/sushi_images.dart';
import 'package:sushi_shop/models/food_cart.dart';
import 'package:sushi_shop/screens/menu_page.dart';

import '../components/description.dart';
import '../components/my_button.dart';
import '../models/food.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({
    super.key,
    this.food,
  }); //make the food parameter optional

  static String routeName = '/details_page';
  final Food? food;

  @override
  Widget build(BuildContext context) {
    // Access the received 'food' object (if present) using 'food?.properties'
    final food = ModalRoute.of(context)?.settings.arguments
        as Food?; // Get food from arguments
    final foodCart = context.read<FoodCart>();
    //variable that controls the counter and operations that increment or decrement the counter
    int quantityToAdd = context.watch<FoodCart>().quantityToAdd;

    int foodQuantity = quantityToAdd + (food?.quantity ?? 0);

    //method to increment the quantity counter
    void incrementCounter() =>
        context.read<FoodCart>().incrementQuantityCounter();

    //method to decrement the quantity counter
    void decrementCounter() =>
        context.read<FoodCart>().decrementQuantityCounter();

    //method to reset the quantity counter
    void resetCounter() => foodCart.resetQuantityCount();
    //method to add item to cart
    void addToCart() {
      if (foodQuantity > 0) {
        //show dialog
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor: primary,
                  content: Text(
                    '${food?.name} added to the cart',
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          foodCart.addToCart(food,
                              foodQuantity); //access the addToCart method from provider
                          //pop to the menu page after item has been added
                          Navigator.popUntil(
                              context, ModalRoute.withName(MenuPage.routeName));

                          //reset the qua
                          resetCounter();
                        },
                        icon: const Icon(Icons.done)),
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close))
                  ],
                ));
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //listview of food details
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                //image
                Image.asset(
                  food?.imagePath ?? emptyMenu, //
                  height: 180,
                ),
                const SizedBox(
                  height: 20,
                ),

                //rating
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        food?.rating ?? '',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    )
                  ],
                ),

                //food name
                Text(
                  food?.name ?? '',
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28, color: menuPageTextStyle),
                ),

                //description
                Description(food: food)
              ],
            ),
          )),

          //price + quantity + add to cart
          Container(
            padding: const EdgeInsets.all(25),
            color: primary,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${food?.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          //decrement Icon
                          Container(
                            decoration: const BoxDecoration(
                                color: secondary, shape: BoxShape.circle),
                            child: IconButton(
                              onPressed: decrementCounter,
                              icon: const Icon(Icons.remove),
                              color: Colors.white,
                            ),
                          ),

                          //quantity
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                foodQuantity.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          //increment icon
                          Container(
                            decoration: const BoxDecoration(
                                color: secondary, shape: BoxShape.circle),
                            child: IconButton(
                              onPressed: incrementCounter,
                              icon: const Icon(Icons.add),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ]),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  onTap: addToCart,
                  text: 'Add To Cart',
                  minbuttonHeight: 64,
                  minButtonWidth: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
