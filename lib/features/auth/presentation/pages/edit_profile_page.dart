import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tlb_app/my_app.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Edit Profile",
          style: TextStyleResource.appBarHeadline,
        ),
        toolbarHeight: 80,
        flexibleSpace: Container(
          color: ColorResource.primary, // Primary color
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: "Nama depan",
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 25),
                _buildTextField(
                  label: "Nama belakang",
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 25),
                _buildTextField(
                  label: "Nomor HP",
                  icon: Icons.smartphone_sharp,
                ),
                const SizedBox(height: 69),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.save, color: Colors.white),
                  iconAlignment: IconAlignment.end,
                  label: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: ColorResource.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    backgroundColor: ColorResource.primary, // Border color
                    minimumSize: const Size.fromHeight(69),
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.logout, color: Colors.red),
                  iconAlignment: IconAlignment.end,
                  label: const Text(
                    "Batal",
                    style: TextStyle(color: Colors.red),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    backgroundColor: Colors.red[50], // Border color
                    minimumSize: const Size.fromHeight(69),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(179, 243, 243, 243), width: 0.0),
        ),
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      readOnly: false,
    );
  }
}
