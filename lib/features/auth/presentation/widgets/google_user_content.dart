import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlb_app/core/common/widgets/custom_card_widget.dart';
import 'package:tlb_app/core/common/widgets/loader.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/my_app.dart';

class GoogleUserContent extends StatelessWidget {
  const GoogleUserContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Loader();
            }
            if (state is Authenticated) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      state.user.picture.isNotEmpty
                          ? Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: ColorResource.primary, // Warna border
                                  width: 3.0,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(state.user.picture),
                                  fit: BoxFit
                                      .scaleDown, // Gambar akan menyesuaikan dan terpotong jika perlu
                                ),
                              ),
                            )
                          : CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.grey[300],
                              child: Icon(
                                Icons.person,
                                size: 45,
                                color: Colors.white,
                              ),
                            ),

                      // const SizedBox(height: 10),
                      TextButton.icon(
                        onPressed: () {
                          context.pushNamed(Routes.editProfilePage.name);
                        },
                        label: const Text("Edit profile"),
                        icon: const Icon(Icons.edit, size: 18),
                        iconAlignment: IconAlignment.end,
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey[500],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Nama',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.black87),
                      ),
                      CustomCardWidget(
                        height: 60,
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 12),
                            Text(
                              state.user.name.isNotEmpty
                                  ? state.user.name
                                  : 'Nama user tidak ditemukan',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Nomor HP',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.black87),
                      ),
                      CustomCardWidget(
                        height: 60,
                        child: Row(
                          children: [
                            Icon(
                              Icons.smartphone_outlined,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 12),
                            Text(
                              state.user.phone.isNotEmpty
                                  ? state.user.phone
                                  : 'No HP user tidak ditemukan',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.black87),
                      ),
                      CustomCardWidget(
                        height: 60,
                        child: Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 12),
                            Text(
                              state.user.email.isNotEmpty
                                  ? state.user.email
                                  : 'Email user tidak ditemukan',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),

                      // const SizedBox(height: 20),
                      // _buildTextField(
                      //   label: "Nama depan",
                      //   icon: Icons.person_outline,
                      // ),
                      // const SizedBox(height: 25),
                      // _buildTextField(
                      //   label: "Nama belakang",
                      //   icon: Icons.person_outline,
                      // ),
                      // const SizedBox(height: 25),
                      // _buildTextField(
                      //   label: "Nomor HP",
                      //   icon: Icons.smartphone_sharp,
                      // ),
                      // const SizedBox(height: 25),
                      // _buildTextField(
                      //   label: "Alamat email",
                      //   icon: Icons.email_outlined,
                      // ),
                      const SizedBox(height: 69),
                      OutlinedButton.icon(
                        onPressed: () {
                          context.read<AuthBloc>().add(UserSignOutEvent());
                          // Supabase.instance.client.auth.signOut();
                          // context.read<AuthBloc>().add(SignedOutEvent());
                          // Navigator.pushReplacementNamed(
                          //     context, Routes.loginPage.name);
                        },
                        icon: const Icon(Icons.logout, color: Colors.red),
                        iconAlignment: IconAlignment.end,
                        label: const Text(
                          "Keluar Akun",
                          style: TextStyle(color: Colors.red),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.red),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          backgroundColor: Colors.red[50], // Border color
                          minimumSize: const Size.fromHeight(50),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
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
