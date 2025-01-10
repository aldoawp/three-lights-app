import 'package:flutter/material.dart';
import 'package:tlb_app/my_app.dart';

class BookingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackPressed; // Callback for back button action

  const BookingAppBar({
    super.key,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      title: const Text(
        'Book an appointment',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      // centerTitle: true,
      backgroundColor: ColorResource.primary,
      foregroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onBackPressed,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
