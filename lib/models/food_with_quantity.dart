import 'package:sushi_shop/models/food.dart';

class FoodWithQuantity {
  final Food food;
  int quantity;

  FoodWithQuantity({
    required this.food,
    required this.quantity,
  });
}
