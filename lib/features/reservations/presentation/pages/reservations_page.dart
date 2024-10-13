import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tlb_app/constants/navigations/navigation_index.dart';
import 'package:tlb_app/features/reservations/presentation/bloc/reservations_bloc.dart';
import 'package:tlb_app/my_app.dart';
import 'package:tlb_app/global_widget.dart';

class ReservationsPage extends StatelessWidget {
  const ReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationsBloc, ReservationsState>(
        bloc: ReservationsBloc(),
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
