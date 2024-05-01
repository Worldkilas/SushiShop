import 'package:sushi_shop/constants/sushi_images.dart';
import 'package:sushi_shop/models/food.dart';

class FoodMenu {
  final List<Food> _availableFoods = [
    //salmon sushi
    Food(
        name: 'Salmon Sushi',
        price: 21.00,
        imagePath: salmonSushi,
        rating: '4.8',
        description:
            'Thinly sliced raw salmon on sushi rice. Soft texture, slightly sweet and savory with a hint of ocean. Enjoy with soy sauce, ginger, and wasabi. (Good protein & omega-3 source!)'),
    //tuna
    Food(
        name: 'Tuna',
        price: 23.00,
        imagePath: tuna,
        rating: '5.00',
        description:
            'Richer taste than salmon. Lean cuts (akami) are firm with a slightly metallic hint, while fattier cuts (chutoro) are smoother and more complex. (Also a good protein & omega-3 source, but ensure fresh sushi-grade tuna!)'),
    //Maguro
    Food(
        name: 'Maguro',
        price: 18,
        imagePath: maguro,
        rating: '4.35',
        description:
            'Japanese term for tuna sushi, often using lean cuts (akami) for a firmer texture and stronger "fishy" flavor compared to fattier tuna options. (Same protein & omega-3 benefits, but fresh sushi-grade tuna is crucial!)')
  ];

  //getters
  List<Food> get foodMenu => _availableFoods;
}
