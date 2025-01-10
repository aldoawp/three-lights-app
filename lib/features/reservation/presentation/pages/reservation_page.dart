import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlb_app/app_wrapper.dart';
import 'package:tlb_app/constants/navigations/navigation_router.dart';
import 'package:tlb_app/features/auth/domain/entities/user.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/features/auth/presentation/pages/login_page.dart';
import 'package:tlb_app/features/profile/presentation/pages/profile_page.dart';
import 'package:tlb_app/features/reservation/domain/repositories/booking_repository.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_bloc.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_event.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_state.dart';
import 'package:tlb_app/features/reservation/presentation/pages/book_appointment_page.dart';
import 'package:tlb_app/features/reservation/presentation/widgets/reservation_app_bar.dart';
import 'package:tlb_app/features/reservation/presentation/widgets/history_widget.dart';
import 'package:tlb_app/features/reservation/presentation/widgets/invoice_widget.dart';
import 'package:tlb_app/injection_container.dart';
import 'package:tlb_app/my_app.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  late User currentUser;

  @override
  void initState() {
    super.initState();

    final authState = context.read<AuthBloc>().state;

    if (authState.user == null) {
      currentUser = User(
          uid: "guest-uid",
          name: "Guest",
          email: "Silahkan sign-in di sini",
          phone: "-",
          isAnonymously: true);
    } else {
      currentUser = authState.user!;
    }

    // histori reservasi
    context
        .read<ReservationBloc>()
        .add(LoadReservationHistoryEvents(currentUser.uid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gunakan AppBar khusus untuk Reservasi
      appBar: ReservationAppBar(
        userName: currentUser.isAnonymously ? "Guest" : currentUser.name,
        userStatus: currentUser.isAnonymously
            ? GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (_) => const ProfilePage()),
                  // );
                  context.pushNamed(Routes.profilePage.name);
                },
                child: Text(
                  "Silahkan sign-in di sini",
                  style: const TextStyle(
                    color: Colors.white54,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white54,
                    decorationThickness: 2.0,
                  ),
                ),
              )
            : Text(currentUser.email),
      ),

      body: BlocBuilder<ReservationBloc, ReservationState>(
        builder: (context, state) {
          if (state is ReservationLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ReservationLoadedState) {
            return _buildReservationContent(state);
          } else if (state is ReservationFailureState) {
            return Center(
              child: Text(
                'Terjadi kesalahan: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const Center(child: Text('Data tidak tersedia.'));
        },
      ),
    );
  }

  Widget _buildReservationContent(ReservationLoadedState state) {
    final ongoingReservations = state.reservations
        .where((reservation) => reservation.status == 'ongoing')
        .toList();
    final historyReservations = state.reservations
        .where((reservation) => reservation.status != 'ongoing')
        .toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 28.0),
          _buildSectionTitle(
            icon: Icons.access_time,
            title: "Reservasi",
          ),
          const SizedBox(height: 4.0),
          ongoingReservations.isEmpty
              ? Column(
                  children: [
                    const SizedBox(height: 24.0),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      padding: const EdgeInsets.all(28.0), // Adjusted padding
                      constraints: const BoxConstraints(
                          minHeight: 150), // Set minimal height
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Saat ini anda tidak memiliki reservasi',
                            style: TextStyle(
                              fontSize: 16, // Reduced font size
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24.0), // Adjusted spacing
                          ElevatedButton.icon(
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const BookingPage(),
                                ),
                              );
                              if (result == true) {
                                context.read<ReservationBloc>().add(
                                    LoadReservationHistoryEvents(
                                        currentUser.uid));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 26.0,
                                  vertical: 12.0), // Adjusted button padding
                              backgroundColor: ColorResource.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            label: const Text(
                              'Reservasi',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            icon: const Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: ongoingReservations.map((reservation) {
                    return InvoiceWidget(
                      invoiceNumber: 'INV-${reservation.reservationId}',
                      date: reservation.date.date.toString(),
                      barberName:
                          '${reservation.barber.firstName} ${reservation.barber.lastName}',
                      serviceName: reservation.service.name,
                      appointmentDate: reservation.date.date.toString(),
                      appointmentTime: reservation.hour.hour.toString(),
                    );
                  }).toList(),
                ),

          const SizedBox(height: 35.0),

          // Bagian Riwayat Reservasi
          _buildSectionTitle(icon: Icons.history, title: "Riwayat"),
          // const SizedBox(height: 4.0),
          ReservationHistoryWidget(
            history: historyReservations.map((item) {
              return {
                'reservationId': item.reservationId,
                'barberName':
                    '${item.barber.firstName} ${item.barber.lastName}',
                'serviceName': item.service.name,
                'appointmentDate': item.date.date.toString(),
                'appointmentTime': item.hour.hour.toString(),
                'status': item.status,
              };
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Widget untuk Judul Section
  Widget _buildSectionTitle({required IconData icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey[600]),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
