import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/features/reservation/domain/entities/barber.dart';
import 'package:tlb_app/features/reservation/domain/entities/service.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/booking_bloc.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/booking_event.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/booking_state.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book an appointment'),
      ),
      body: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          if (state is BookingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BookingError) {
            return Center(child: Text(state.message));
          } else if (state is BookingLoaded) {
            return BookingForm(state: state);
          }
          return const Center(child: Text('Please wait...'));
        },
      ),
    );
  }
}

class BookingForm extends StatelessWidget {
  final BookingLoaded state;

  const BookingForm({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton<Barber>(
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
          // Text('Pilih tanggal', style: Theme.of(context).textTheme.bodyMedium),
          // ElevatedButton(
          //   onPressed: () async {
          //     final selectedDate = await showDatePicker(
          //       context: context,
          //       initialDate: DateTime.now(),
          //       firstDate: DateTime.now(),
          //       lastDate: DateTime.now().add(const Duration(days: 30)),
          //     );
          //     if (selectedDate != null) {
          //       context.read<BookingBloc>().add(SelectDate(date: selectedDate));
          //     }
          //   },
          //   child: Text(
          //     state.selectedDate != null
          //         ? state.selectedDate!.toString().split(' ')[0]
          //         : 'Select a date',
          //   ),
          // ),
          // const SizedBox(height: 16),
          Text('Pilih waktu', style: Theme.of(context).textTheme.bodySmall),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: state.booking.avaibleHours.map((hour) {
              return ChoiceChip(
                label: Text(hour.hour),
                selected: state.selectedTime == hour,
                onSelected: (_) {
                  context.read<BookingBloc>().add(SelectTime(time: hour));
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          DropdownButton<Service>(
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
          Card(
            child: ListTile(
              title: const Text('Summary'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Biaya servis: Rp ${state.selectedService?.price ?? 0}'),
                  const Text('Biaya admin: Rp 2.000'),
                  Text(
                      'Total: Rp ${state.selectedService?.price != null ? state.selectedService!.price + 2000 : 0}'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle payment logic
            },
            child: const Text('Bayar'),
          ),
        ],
      ),
    );
  }
}
