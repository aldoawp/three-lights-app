import 'package:flutter/material.dart';
import 'package:tlb_app/my_app.dart';

class ReservationAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName; // Nama user
  final Widget userStatus; // Status user
  final String? userImageUrl; // URL

  const ReservationAppBar({
    super.key,
    required this.userName,
    required this.userStatus,
    this.userImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80 + MediaQuery.of(context).padding.top,
      decoration: const BoxDecoration(
        color: ColorResource.primary,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              // Avatar User
              CircleAvatar(
                radius: 24.0,
                backgroundColor: Colors.white,
                backgroundImage: userImageUrl != null
                    ? NetworkImage(userImageUrl!)
                    : null, // Gambar profil jika tersedia
                child: userImageUrl == null
                    ? const Icon(Icons.person, size: 24, color: Colors.grey)
                    : null,
              ),
              const SizedBox(width: 16.0),
              // Informasi User
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Halo, $userName',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  userStatus, // Directly use the Widget passed as userStatus
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
