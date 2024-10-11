import 'package:flutter/material.dart';
import 'package:tlb_app/main.dart';

class HeroImage extends StatelessWidget {
  final String image;
  final double imageSize;
  final double decorBoxSize;

  const HeroImage({
    super.key,
    required this.image,
    required this.imageSize,
    required this.decorBoxSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage(image),
          fit: BoxFit.cover,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / imageSize,
        ),
        Container(
          height: MediaQuery.of(context).size.height / decorBoxSize,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                ColorResource.bgWhite, // Solid color at the center
                Colors.transparent, // Transparent at the top
              ],
            ),
          ),
        )
      ],
    );
  }
}
