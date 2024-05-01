import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop/constants/pallete.dart';
import 'package:sushi_shop/models/food_cart.dart';
import 'package:sushi_shop/screens/cart_page.dart';
import 'package:sushi_shop/screens/details_page.dart';
import 'package:sushi_shop/screens/intro_page.dart';
import 'package:sushi_shop/screens/menu_page.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_) => FoodCart(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(scaffoldBackgroundColor: primary),
      initialRoute: IntroPage.routeName,
      routes: {
        IntroPage.routeName: (context) => const IntroPage(),
        MenuPage.routeName: (context) => const MenuPage(),
        FoodDetailsPage.routeName: (context) => const FoodDetailsPage(),
        CartPage.routeName: (context) => const CartPage()
      },
    );
  }
}
