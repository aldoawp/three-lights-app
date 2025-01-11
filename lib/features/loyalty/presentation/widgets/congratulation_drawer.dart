import 'package:flutter/material.dart';
import 'package:tlb_app/my_app.dart';

class CongratulationsDrawer extends StatelessWidget {
  const CongratulationsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center content vertically
        children: [
          // Combine image and text into a single widget
          Stack(
            children: [
              // Image background
              Image.asset(
                'lib/assets/images/loyalty_success_msg.png', // Assuming it's JPG
                width: double.infinity, // Match container width
                height: 400, // Adjust height as needed
                fit: BoxFit.cover, // Fill the container
              ),
              // Text positioned on top of the image
            ],
          ),
          const SizedBox(height: 20.0), // Add some spacing after the image
          Container(
            // Container untuk kotak hijau
            padding: const EdgeInsets.symmetric(
                vertical: 20, horizontal: 20), // Padding dalam kotak
            decoration: BoxDecoration(
              color: ColorResource.primary, // Warna latar belakang hijau
              borderRadius: BorderRadius.circular(10), // Sudut membulat
            ),
            width: double.infinity,
            child: const Text(
              "Kamu mendapatkan gratis 1x potong,",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700), // Warna teks putih
            ),
          ),
        ],
      ),
    );
  }
}
