import 'package:flutter/material.dart';

class ReservationHistoryWidget extends StatelessWidget {
  final List<Map<String, dynamic>> history;

  const ReservationHistoryWidget({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 16),
            history.isEmpty
                ? const Center(
                    child: Text(
                      'Anda belum memiliki riwayat reservasi',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: history.length,
                    itemBuilder: (context, index) {
                      final item = history[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '#${item['reservationId']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                item['status'], // Example: 'Completed'
                                style: TextStyle(
                                  fontSize: 14,
                                  color: item['status'] == 'completed'
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Barber: ${item['barberName']}',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Service: ${item['serviceName']}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.calendar_today_outlined,
                                  color: Colors.grey[600], size: 16),
                              const SizedBox(width: 8),
                              Text(
                                item['appointmentDate'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Icon(Icons.access_time,
                                  color: Colors.grey[600], size: 16),
                              const SizedBox(width: 8),
                              Text(
                                item['appointmentTime'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Divider(height: 16),
                        ],
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
