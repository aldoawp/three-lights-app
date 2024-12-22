import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/features/auth/domain/entities/user.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/features/reservation/domain/repositories/booking_repository.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/booking_bloc.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/booking_event.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/booking_state.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_bloc.dart';
import 'package:tlb_app/features/reservation/presentation/pages/payment_page.dart';
import 'package:tlb_app/features/reservation/presentation/widgets/book_apointment_app_bar.dart';
import 'package:tlb_app/injection_container.dart';

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
    currentUser = context.read<AuthBloc>().state.user!;
    context.read<ReservationBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingAppBar(
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: BlocListener<BookingBloc, BookingState>(
        listener: (context, state) {
          if (state is BookingSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                // content: Text("Reservation created successfully!")),
                content: Text(
                  sl<BookingRepository>().getPaymentToken ?? 'KONYOL',
                ),
                duration: Duration(seconds: 5),
              ),
            );
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => PaymentPage()));
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
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      children: [
        _buildDropdown(
          context: context,
          title: "Pilih barber",
          hint: "Pilih barber",
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
        _buildDropdown(
          context: context,
          title: "Pilih tanggal",
          hint: "Pilih tanggal",
          value: state.selectedDate,
          items: state.booking.avaibleDates.map((date) {
            return DropdownMenuItem(
              value: date,
              enabled: date.status != 'booked',
              child: Text(
                date.date,
                style: TextStyle(
                  color: date.status == 'booked' ? Colors.grey : Colors.black,
                ),
              ),
            );
          }).toList(),
          onChanged: (date) {
            if (date?.status != 'booked') {
              context.read<BookingBloc>().add(SelectDate(date: date!));
            }
          },
        ),
        const SizedBox(height: 10),
        _buildSectionTitle("Pilih waktu"),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: state.booking.avaibleHours.map((hour) {
            final isAvailable = hour.status != 'booked';
            return ChoiceChip(
              label: Text(
                hour.hour,
                style: TextStyle(
                  color: isAvailable ? Colors.black : Colors.grey,
                ),
              ),
              selected: state.selectedTime == hour,
              onSelected: isAvailable
                  ? (_) {
                      context.read<BookingBloc>().add(SelectTime(time: hour));
                    }
                  : null,
              selectedColor: Colors.green.shade300,
              backgroundColor:
                  isAvailable ? Colors.white : Colors.grey.shade300,
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        _buildDropdown(
          context: context,
          title: "Pilih servis",
          hint: "Pilih servis",
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
        const SizedBox(height: 20),
        _buildSummary(state),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
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

            // Tunggu respons dari Midtrans setelah reservasi berhasil
            final bookingState = context.read<BookingBloc>().state;
            if (bookingState is BookingSuccess) {
              final paymentToken = sl<BookingRepository>().getPaymentToken;

              if (paymentToken != null) {
                // Navigasi ke halaman pembayaran
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Gagal mendapatkan token pembayaran")),
                );
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: const Size.fromHeight(50),
            shadowColor: Colors.black.withOpacity(0.5),
            elevation: 4,
          ),
          child: const Text('Bayar', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildDropdown<T>({
    required BuildContext context,
    required String title,
    required String hint,
    required T? value,
    required List<DropdownMenuItem<T>> items,
    required ValueChanged<T?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButton<T>(
            isExpanded: true,
            underline: const SizedBox(),
            hint: Text(hint),
            value: value,
            items: items,
            onChanged: onChanged,
            dropdownColor: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontWeight: FontWeight.bold));
  }

  Widget _buildSummary(BookingLoaded state) {
    return Card(
      shadowColor: Colors.black.withOpacity(0.3),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSummaryRow(
                'Biaya Servis', 'Rp ${state.selectedService?.price ?? 0}'),
            _buildSummaryRow('Biaya Admin', 'Rp 2.000'),
            _buildSummaryRow('PPN 11%', 'Rp 0'),
            const Divider(),
            _buildSummaryRow('Total',
                'Rp ${state.selectedService?.price != null ? state.selectedService!.price + 2000 : 0}',
                isBold: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
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
