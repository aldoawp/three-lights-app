import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/features/loyalty/presentation/bloc/loyalty_bloc.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/barbershop_header.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/congratulation_drawer.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/history_item_data.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/loyalty_card_title.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/qr_scan_button.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/stamp_row.dart';

class LoyaltyCard extends StatelessWidget {
  const LoyaltyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoyaltyBloc, LoyaltyState>(
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is LoyaltyUpdated &&
            state.stamps == 0 &&
            state.history.isNotEmpty) {
          Future.delayed(Duration.zero, () {
            // Use Future.delayed
            showModalBottomSheet(
              context: context,
              builder: (context) => const CongratulationsDrawer(),
            );
          });
        }
      },
      builder: (context, state) {
        int stamps = 0;
        if (state is LoyaltyUpdated) {
          stamps = state.stamps;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BarbershopHeader(),
            const SizedBox(height: 20),
            const Divider(),
            const LoyaltyCardTitle(),
            const Divider(),
            const SizedBox(height: 20),
            StampRow(stampsCollected: stamps), // Pass stamps
          ],
        );
      },
    );
  }
}
