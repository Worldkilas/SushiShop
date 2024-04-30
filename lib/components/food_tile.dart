import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_shop/constants/pallete.dart';
import 'package:sushi_shop/models/food.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food, this.onTap});
  final Food food;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              Image.asset(
                food.imagePath,
                height: 140,
              ),

              //text
              Text(
                food.name,
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 20, color: Colors.grey[800]),
              ),

              //price+ rating
              SizedBox(
                width: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      '\$ ${food.price}',
                      style: TextStyle(color: menuPageTextStyle),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                        ),
                        //rating
                        Text(
                          food.rating,
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
