import 'package:flutter/material.dart';
import 'package:tlb_app/my_app.dart';

class ReservationCard extends StatelessWidget {
  final String reservation;

  ReservationCard({required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Reservation',
              style: TextStyleResource.headingXL,
            ),
            SizedBox(height: 8.0),
            Text(reservation),
          ],
        ),
      ),
    );
  }
}
