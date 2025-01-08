import 'package:flutter/material.dart';
import 'package:tlb_app/features/reservation/data/models/avaible_date_model.dart';
import 'package:tlb_app/features/reservation/domain/entities/avaible_date.dart';

class ReservationHistoryWidget extends StatelessWidget {
  final List<Map<String, dynamic>> history;

  const ReservationHistoryWidget({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          history.isEmpty
              ? const Center(
                  child: Text(
                    'Anda belum memiliki riwayat reservasi',
                    style: TextStyle(fontSize: 14, color: Color(0xFFB0B0B0)),
                  ),
                )
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    final item = history[index];
                    final bool isDone = item['status'] == 'completed';

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Icon status (checkmark or X)
                          Container(
                            decoration: BoxDecoration(
                              color:
                                  isDone ? Colors.green[100] : Colors.red[100],
                              shape: BoxShape.rectangle,
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              isDone ? Icons.check : Icons.close,
                              color: isDone ? Colors.green : Colors.red,
                              size: 25,
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Reservation details and date
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Reservation ID and Date in a Row
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '# INV-${item['reservationId']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      item['appointmentDate']
                                              is AvaibleDateModel
                                          ? (item['appointmentDate']
                                              as AvaibleDate)
                                          : item['appointmentDate'],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                // Barber and Service with icons
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.person, // Barber icon
                                      color: Colors.grey,
                                      size: 12,
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        'Barber: ${item['barberName']}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.cut_outlined,
                                      color: Colors.grey,
                                      size: 12,
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        'Service: ${item['serviceName']}',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
