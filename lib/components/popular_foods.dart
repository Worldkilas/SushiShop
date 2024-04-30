import 'package:flutter/material.dart';
import 'package:sushi_shop/constants/pallete.dart';
import 'package:sushi_shop/constants/sushi_images.dart';

class PopularFood extends StatelessWidget {
  const PopularFood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            //image
            Image.asset(
              salmonEggs,
              height: 60,
            ),

            //name and price
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Salmon Eggs',
                  style: TextStyle(
                      color: menuPageTextStyle,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text('\$ 21.00', style: TextStyle(color: Colors.grey[700]))
              ],
            )
          ],
        ),
        const Icon(
          Icons.favorite_border_outlined,
          size: 30,
          color: Colors.grey,
        )
      ]),
    );
  }
}
