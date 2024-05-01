import 'package:flutter/material.dart';
import 'package:sushi_shop/constants/pallete.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      this.onTap,
      required this.text,
      required this.minbuttonHeight,
      required this.minButtonWidth});
  final void Function()? onTap;
  final String text;
  final double minbuttonHeight;
  final double minButtonWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(0),
      color: primary,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: secondary,
            minimumSize: Size(minButtonWidth, minbuttonHeight)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(Icons.arrow_forward, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
