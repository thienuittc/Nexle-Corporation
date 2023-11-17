import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(imagePath),
            ),
          ),
        ),
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey.withOpacity(0),
                Colors.black.withOpacity(0.5),
                Colors.black,
              ],
              stops: [0.2, 0.3, 0.5],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
      ],
    );
  }
}
