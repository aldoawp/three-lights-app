import 'package:flutter/material.dart';

class CongratulationsDrawer extends StatelessWidget {
  const CongratulationsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Center(
        child: Text(
          "Selamat, tolong tunjukkan pesan ini ke kasir untuk mendapatkan potongan gratis!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
