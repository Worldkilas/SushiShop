import 'package:flutter/material.dart';
import 'package:sushi_shop/components/popular_foods.dart';
import 'package:sushi_shop/components/promo_banner.dart';
import 'package:sushi_shop/constants/pallete.dart';
import 'package:sushi_shop/models/food_menu.dart';
import 'package:sushi_shop/screens/cart_page.dart';
import 'package:sushi_shop/screens/details_page.dart';

import '../components/food_tile.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  static String routeName = '/menu_page';

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //food menu
  final foodMenu = FoodMenu().foodMenu;

  //method to navigate to food item details
  void navigateToFoodDetails(int index) {
    Navigator.pushNamed(context, FoodDetailsPage.routeName,
        arguments:
            foodMenu[index]); // sends the individual foodMenu as an argument
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        foregroundColor: Colors.grey[900],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
          color: appBarText,
        ),
        title: Text(
          'Tokyo',
          style: TextStyle(color: appBarText),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, CartPage.routeName),
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //promo banner
        PromoBanner(size: size),

        const SizedBox(
          height: 20,
        ),

        //search bar
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search here...',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20))),
            )),

        const SizedBox(
          height: 20,
        ),

        //menu list
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Food Menu',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800]),
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        //food menu
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodMenu.length,
            itemBuilder: (context, index) => FoodTile(
              food: foodMenu[index],
              onTap: () => navigateToFoodDetails(index),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),

        //popular foods
        const PopularFood()
      ]),
    );
  }
}
