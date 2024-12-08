import 'package:flutter/material.dart';
import 'package:tlb_app/my_app.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorResource.primary,
      ),
    );
  }
}
