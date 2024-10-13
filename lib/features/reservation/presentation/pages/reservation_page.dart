import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/constants/navigations/navigation_index.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_bloc.dart';
import 'package:tlb_app/my_app.dart';
import 'package:tlb_app/global_widget.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationBloc, ReservationState>(
        bloc: ReservationBloc(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              flexibleSpace: Container(
                color: ColorResource.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.userImageURL),
                    Text(state.userName),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: NavBar(
              currentIndex: reservationPageIndex,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Main Content"),
                ],
              ),
            ),
          );
        });
  }
}
