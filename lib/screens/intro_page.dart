import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_shop/components/my_button.dart';
import 'package:sushi_shop/constants/sushi_images.dart';
import 'package:sushi_shop/screens/menu_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  static String routeName = '/intro_page';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //shop name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'SUSHI MAN',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                ),
              ),
            ),

            //icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset(salmonEggs),
            ),

            //title
            Text(
              'THE TASTE OF JAPANESE FOOD',
              style: GoogleFonts.dmSerifDisplay(fontSize: 45),
            ),

            //subtitile
            Text(
              'Feel the taste of the most popular japanese food from anywhere and anytime',
              style: TextStyle(
                  color: Colors.grey[300], height: 2, letterSpacing: 1.5),
            ),

            //get started button
            MyButton(
              text: 'Get Started',
              onTap: () => Navigator.pushNamed(context, MenuPage.routeName),
              minbuttonHeight: 65,
              minButtonWidth: size.width,
            )
          ],
        ),
      ),
    );
  }
}
