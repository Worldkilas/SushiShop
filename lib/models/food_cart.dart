import 'package:flutter/material.dart';
import 'package:sushi_shop/models/food.dart';

class FoodCart extends ChangeNotifier {
  final List<Food> _foodCart = [];
  int _quantityToAdd = 0;

  void incrementQuantityCounter() {
    _quantityToAdd++;
    notifyListeners();
  }

  void decrementQuantityCounter() {
    if (_quantityToAdd > 0) {
      _quantityToAdd--;
    }
    notifyListeners();
  }

  /*

  G E T T E R S

  */
  int get quantityToAdd => _quantityToAdd;
  List<Food> get foodCart => List.unmodifiable(_foodCart);

  //Add to cart method
  void addToCart(Food? foodItem, int quantity) {
    if (foodItem == null || quantity <= 0) {
      return;
    }
    // print("Adding to cart: ${foodItem.name}, quantity: $quantity");
    bool foundInCart = false;
    for (Food itemInCart in _foodCart) {
      if (itemInCart == foodItem) {
        foundInCart = true;
        itemInCart.quantity += quantity;
        continue;
      }
    }
    if ((!foundInCart)) {
      _foodCart.add(foodItem);
    }

    notifyListeners();
    // print("Cart updated. Current cart items: $_foodCart");
  }

  //delete from cart
  void deleteFromCart(Food foodItem) {
    _foodCart.remove(foodItem);
    notifyListeners();
  }

  void resetQuantityCount() {
    _quantityToAdd = 0;
    notifyListeners();
  }

  String calculateTotalPrice() {
    double totalPrice = 0;
    for (Food foodItem in _foodCart) {
      totalPrice += foodItem.price * foodItem.quantity;
    }
    return totalPrice.toStringAsFixed(2);
  }
}
