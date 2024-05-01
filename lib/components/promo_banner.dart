import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_shop/components/my_button.dart';
import 'package:sushi_shop/constants/pallete.dart';
import 'package:sushi_shop/constants/sushi_images.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(18)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //promo message and redeem message
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //promo message
              Text(
                'Get 32% promo',
                style: GoogleFonts.dmSerifDisplay(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              //redeem button
              MyButton(
                text: 'Redeem',
                minbuttonHeight: size.height * 0.06,
                minButtonWidth: size.width * 0.01,
              )
            ],
          ),

          //image
          Image.asset(
            promoImage,
            height: 100,
          )
        ],
      ),
    );
  }
}
