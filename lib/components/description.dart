import 'package:flutter/material.dart';

import '../constants/pallete.dart';
import '../models/food.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.food,
  });

  final Food? food;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: food?.description != null
            ? TextSpan(children: [
                TextSpan(
                    text: 'Description\n',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: menuPageTextStyle)),
                const WidgetSpan(
                    child: SizedBox(
                  height: 10,
                )),
                TextSpan(
                    text: food?.description,
                    style: TextStyle(color: Colors.grey[600], height: 2))
              ])
            : TextSpan(
                text: 'Description not available',
                style: TextStyle(color: Colors.grey[600], height: 2)));
  }
}
