import 'package:equatable/equatable.dart';

//using the eqautable package to check for object equality

// ignore: must_be_immutable
class Food extends Equatable {
  final String name;
  final double price;
  final String imagePath;
  final String rating;
  final String? description;
  int _quantity = 1;

  Food(
      {required this.name,
      required this.price,
      required this.imagePath,
      required this.rating,
      this.description});

  int get quantity => _quantity;
  set quantity(int newQuantity) {
    if (newQuantity <= 0) {
      throw Exception('Quantity can neither be zero or less');
    }
    _quantity = newQuantity;
  }

  @override
  List<Object?> get props => [name, price, imagePath, rating];
}
