import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/features/auth/domain/entities/user.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_bloc.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_event.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_state.dart';
import 'package:tlb_app/features/reservation/presentation/pages/book_appointment_page.dart';
import 'package:tlb_app/features/reservation/presentation/widgets/reservation_app_bar.dart';
import 'package:tlb_app/features/reservation/presentation/widgets/history_widget.dart';
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
      appBar: ReservationAppBar(
        userName: "Guest",
        userStatus: "Silahkan sign-in di sini",
        userImageUrl: null,
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
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.grey[600]),
                        const SizedBox(width: 8),
                        Text(
                          "Reservasi",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                    Column(
                      children: ongoing.map((reservation) {
                        return InvoiceWidget(
                          invoiceNumber: 'INV-${reservation.reservationId}',
                          date: reservation.dateData.toString(),
                          barberName:
                              '${reservation.barberFirstName} ${reservation.barberLastName}',
                          serviceName: reservation.serviceName,
                          appointmentDate: reservation.dateData.toString(),
                          appointmentTime: reservation.hourData.toString(),
                        );
                      }).toList(),
                    ),
                  const SizedBox(height: 35.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Icon(Icons.history, color: Colors.grey[600]),
                        const SizedBox(width: 8),
                        Text(
                          "Riwayat",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ReservationHistoryWidget(
                    history: history.map((item) {
                      return {
                        'reservationId': item.reservationId,
                        'barberName':
                            '${item.barberFirstName} ${item.barberLastName}',
                        'serviceName': item.serviceName,
                        'appointmentDate': item.dateData,
                        'appointmentTime': item.hourData,
                        'status': item.status,
                      };
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
