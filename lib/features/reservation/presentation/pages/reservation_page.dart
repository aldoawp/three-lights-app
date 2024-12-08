import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/features/auth/domain/entities/user.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_bloc.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_event.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_state.dart';
import 'package:tlb_app/features/reservation/presentation/pages/book_appointment_page.dart';
import 'package:tlb_app/features/reservation/presentation/widgets/invoice_widget.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  @override
  void initState() {
    super.initState();
    final User currUser = context.read<AuthBloc>().state.user!;
    context
        .read<ReservationBloc>()
        .add(LoadReservationHistoryEvents(currUser.uid));
  }

  @override
  Widget build(BuildContext context) {
    final User currUser = context.read<AuthBloc>().state.user!;
    return Scaffold(
      appBar: AppBar(
        title: Text(currUser.uid),
      ),
      body: BlocBuilder<ReservationBloc, ReservationState>(
        builder: (context, state) {
          if (state is ReservationLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ReservationLoadedState) {
            final ongoing = state.ongoing;
            final history = state.history;

            return SingleChildScrollView(
              child: Column(
                children: [
                  // Ongoing reservation
                  if (ongoing.isEmpty)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BookAppointmentPage()),
                        );
                      },
                      child: const Text('Create Reservation'),
                    )
                  else
                    // Display ongoing reservations dynamically using InvoiceWidget
                    Column(
                      children: ongoing.map((reservation) {
                        return InvoiceWidget(
                          invoiceNumber:
                              'INV-${reservation.reservationId}', // Contoh nomor invoice
                          date:
                              '09-12-2024', // Tentukan tanggal sesuai data Anda
                          barberName:
                              '${reservation.barberFirstName} ${reservation.barberLastName}',
                          serviceName: reservation.serviceName,
                          appointmentDate: reservation.dateData.toString(),
                          appointmentTime: reservation.hourData.toString(),
                        );
                      }).toList(),
                    ),

                  // History reservation (similar display structure)
                  if (history.isNotEmpty)
                    Column(
                      children: history.map((reservation) {
                        return InvoiceWidget(
                          invoiceNumber: 'INV-${reservation.reservationId}',
                          date: '09-12-2024', // Tanggal yang diambil dari data
                          barberName:
                              '${reservation.barberFirstName} ${reservation.barberLastName}',
                          serviceName: reservation.serviceName,
                          appointmentDate: reservation.dateData.toString(),
                          appointmentTime: reservation.hourData.toString(),
                        );
                      }).toList(),
                    ),
                ],
              ),
            );
          } else if (state is ReservationFailureState) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('No data available'));
        },
      ),
    );
  }
}
