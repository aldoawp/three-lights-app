// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tlb_app/features/reservation/domain/usecases/cancel_reservation.dart';
// import 'package:tlb_app/features/reservation/domain/usecases/create_reservation.dart';
// import 'package:tlb_app/features/reservation/domain/usecases/get_reservation_history.dart';
// import 'package:tlb_app/features/reservation/presentation/bloc/reservation_bloc.dart';

// class ReservationPage extends StatelessWidget {
//   final String userId;

//   const ReservationPage({Key? key, required this.userId}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reservations'),
//       ),
//       body: BlocProvider(
//         create: (context) => ReservationBloc(
//           createReservationUseCase: context.read<CreateReservation>(),
//           cancelReservationUseCase: context.read<CancelReservation>(),
//           getReservationHistoryUseCase: context.read<GetReservationHistory>(),
//         )..add(LoadReservationHistoryEvents(userId)),
//         child: BlocBuilder<ReservationBloc, ReservationState>(
//           builder: (context, state) {
//             if (state is ReservationLoadingState) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is ReservationFailureState) {
//               return Center(child: Text(state.message));
//             } else if (state is ReservationLoadedState) {
//               return Column(
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: state.ongoing.length,
//                       itemBuilder: (context, index) {
//                         final reservation = state.ongoing[index];
//                         return ListTile(
//                           title: Text(
//                               "Reservation ID: ${reservation.reservationID}"),
//                           subtitle: Text(reservation.status),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.cancel),
//                             onPressed: () {
//                               context.read<ReservationBloc>().add(
//                                     CancelReservationEvent(
//                                         reservation.reservationID, userId),
//                                   );
//                             },
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: state.history.length,
//                       itemBuilder: (context, index) {
//                         final reservation = state.history[index];
//                         return ListTile(
//                           title: Text(
//                               "Reservation Service: ${reservation.serviceId}"),
//                           subtitle: Text(reservation.status),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               );
//             }
//             return const Center(child: Text('No Reservations Found'));
//           },
//         ),
//       ),
//     );
//   }
// }
