import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:tlb_app/core/common/widgets/loader.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/my_app.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormBuilderState>();

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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    const SizedBox(height: 20),

                    FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'namaDepan',
                            decoration:
                                InputDecoration(labelText: 'Nama Depan'),
                            initialValue: state.user.name.isNotEmpty
                                ? state.user.name.split(' ')[0]
                                : '',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.alphabetical()
                            ]),
                          ),
                          const SizedBox(height: 25),
                          FormBuilderTextField(
                            name: 'namaBelakang',
                            decoration:
                                InputDecoration(labelText: 'Nama Belakang'),
                            initialValue: state.user.name.isNotEmpty
                                ? state.user.name
                                    .split(' ')
                                    .sublist(1)
                                    .join(' ')
                                : '',
                            validator: FormBuilderValidators.alphabetical(
                                checkNullOrEmpty: false),
                          ),
                          const SizedBox(height: 25),
                          FormBuilderTextField(
                            name: 'noHp',
                            decoration: InputDecoration(labelText: 'No HP'),
                            initialValue: state.user.phone.isNotEmpty
                                ? state.user.phone
                                : '',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              (value) {
                                final regex = RegExp(r'^\+?[1-9]\d{1,14}$');
                                if (value == null || !regex.hasMatch(value)) {
                                  return 'Nomor telepon harus dalam format internasional';
                                }
                                return null;
                              },
                            ]),
                          ),
                        ],
                      ),
                    ),

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
                    const SizedBox(height: 69),
                    OutlinedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          final formData = _formKey.currentState!.value;

                          print("Form data: $formData");

                          context.read<AuthBloc>().add(UserUpdateEvent(
                              entity: state.user,
                              namaDepan: formData['namaDepan'],
                              namaBelakang: formData['namaBelakang'],
                              noHp: formData['noHp']));
                        }
                      },
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
            );
          }
          return Container();
        },
      )),
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
