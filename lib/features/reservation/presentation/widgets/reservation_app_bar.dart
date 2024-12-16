import 'package:flutter/material.dart';
import 'package:tlb_app/my_app.dart';

class ReservationAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName; // Nama user
  final String userStatus; // Status user
  final String? userImageUrl; // URL gambar profil (opsional)

  const ReservationAppBar({
    super.key,
    required this.userName,
    required this.userStatus,
    this.userImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  GestureDetector(
                    onTap: () {
                      // Aksi sign-in atau lainnya
                    },
                    child: Text(
                      userStatus,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white70,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Icon Search
              // IconButton(
              //   icon: const Icon(Icons.notifications, color: Colors.white),
              //   onPressed: () {
              //     // Tambahkan aksi notifikasi
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72.0); // Tinggi AppBar
}
