import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/features/reservation/domain/entities/reservation.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_bloc.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_event.dart';

class BookAppointmentPage extends StatelessWidget {
  final TextEditingController serviceIdController = TextEditingController();
  final TextEditingController barberIdController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController hourController = TextEditingController();
  final TextEditingController paymentMethodController = TextEditingController();

  BookAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: serviceIdController,
              decoration: InputDecoration(labelText: 'Service ID'),
            ),
            TextField(
              controller: barberIdController,
              decoration: InputDecoration(labelText: 'Barber ID'),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: hourController,
              decoration: InputDecoration(labelText: 'Hour'),
            ),
            TextField(
              controller: paymentMethodController,
              decoration: InputDecoration(labelText: 'Payment Method'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final reservation = Reservation(
                  reservationId: 0,
                  userId: "userId123",
                  serviceId: int.parse(serviceIdController.text),
                  serviceName: "",
                  servicePrice: 0,
                  dateId: 0,
                  dateData: dateController.text,
                  hourId: 0,
                  hourData: hourController.text,
                  barberId: int.parse(barberIdController.text),
                  // barberName: "",
                  barberFirstName: "",
                  barberLastName: "",
                  paymentMethod: paymentMethodController.text,
                  totalpayment: 0,
                  status: "ongoing",
                );

                context
                    .read<ReservationBloc>()
                    .add(CreateReservationEvents(reservation));
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
