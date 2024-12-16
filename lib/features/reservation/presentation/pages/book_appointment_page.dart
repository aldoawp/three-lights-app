import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/features/auth/domain/entities/user.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/features/reservation/domain/entities/barber.dart';
import 'package:tlb_app/features/reservation/domain/entities/service.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/booking_bloc.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/booking_event.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/booking_state.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_bloc.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  late User currentUser;

  @override
  void initState() {
    super.initState();

    // Retrieve the current user and load reservation history
    currentUser = context.read<AuthBloc>().state.user!;
    context.read<ReservationBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book an Appointment'),
      ),
      body: BlocListener<BookingBloc, BookingState>(
        listener: (context, state) {
          if (state is BookingSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text("Reservation created successfully!")),
            );

            // Redirect to the reservation page
            Navigator.pop(context, true);
          } else if (state is BookingError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<BookingBloc, BookingState>(
          builder: (context, state) {
            if (state is BookingLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookingError) {
              return Center(child: Text(state.message));
            } else if (state is BookingLoaded) {
              return BookingForm(state: state, currentUser: currentUser);
            }
            return const Center(child: Text('Please wait...'));
          },
        ),
      ),
    );
  }
}

class BookingForm extends StatelessWidget {
  final BookingLoaded state;
  final User currentUser;

  const BookingForm(
      {super.key, required this.state, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          // Barber Selection Dropdown
          const Text('Pilih Barber',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          DropdownButton<Barber>(
            isExpanded: true,
            hint: const Text('Pilih barber'),
            value: state.selectedBarber,
            items: state.booking.barbers.map((barber) {
              return DropdownMenuItem(
                value: barber,
                child: Text(barber.firstName),
              );
            }).toList(),
            onChanged: (barber) {
              context.read<BookingBloc>().add(SelectBarber(barber: barber!));
            },
          ),
          const SizedBox(height: 16),

          // Date Selection (Dynamic ChoiceChips)
          const Text('Pilih Tanggal',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Wrap(
                spacing: 12,
                runSpacing: 8,
                children: state.booking.avaibleDates.map((date) {
                  return ChoiceChip(
                    label: Text(date.date),
                    selected: state.selectedDate == date,
                    onSelected: (_) {
                      context.read<BookingBloc>().add(SelectDate(date: date));
                    },
                    selectedColor: Colors.green.shade300,
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Time Selection
          const Text('Pilih Waktu',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: state.booking.avaibleHours.map((hour) {
              return ChoiceChip(
                label: Text(hour.hour),
                selected: state.selectedTime == hour,
                onSelected: (_) {
                  context.read<BookingBloc>().add(SelectTime(time: hour));
                },
                selectedColor: Colors.green.shade300,
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          // Service Selection Dropdown
          const Text('Pilih Servis',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          DropdownButton<Service>(
            isExpanded: true,
            hint: const Text('Pilih servis'),
            value: state.selectedService,
            items: state.booking.services.map((service) {
              return DropdownMenuItem(
                value: service,
                child: Text(service.name),
              );
            }).toList(),
            onChanged: (service) {
              context.read<BookingBloc>().add(SelectService(service: service!));
            },
          ),
          const SizedBox(height: 16),

          // Summary Section
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Summary',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  _buildSummaryRow('Biaya Servis',
                      'Rp ${state.selectedService?.price ?? 0}'),
                  _buildSummaryRow('Biaya Admin', 'Rp 2.000'),
                  _buildSummaryRow('PPN 11%', 'Rp 0'),
                  const Divider(),
                  _buildSummaryRow(
                    'Total',
                    'Rp ${state.selectedService?.price != null ? state.selectedService!.price + 2000 : 0}',
                    isBold: true,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Payment Button
          ElevatedButton(
            onPressed: () {
              if (state.selectedBarber == null ||
                  state.selectedDate == null ||
                  state.selectedTime == null ||
                  state.selectedService == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Please complete all selections!")),
                );
                return;
              }

              context.read<BookingBloc>().add(
                    CreateReservation(
                      reservationData: {
                        "user_id": currentUser.uid,
                        "service_id": state.selectedService!.serviceId,
                        "barber_id": state.selectedBarber!.barberId,
                        "date_id": state.selectedDate!.dateId,
                        "hour_id": state.selectedTime!.hourId,
                      },
                    ),
                  );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: const Size.fromHeight(50), // Full-width button
            ),
            child: const Text('Bayar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style:
                  isBold ? const TextStyle(fontWeight: FontWeight.bold) : null),
          Text(value,
              style:
                  isBold ? const TextStyle(fontWeight: FontWeight.bold) : null),
        ],
      ),
    );
  }
}
