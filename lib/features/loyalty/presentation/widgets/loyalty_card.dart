import 'package:flutter/material.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/barbershop_header.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/loyalty_card_title.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/qr_scan_button.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/stamp_row.dart';

class LoyaltyCard extends StatefulWidget { // Make LoyaltyCard stateful
  const LoyaltyCard({super.key});

  @override
  State<LoyaltyCard> createState() => _LoyaltyCardState();
}

class _LoyaltyCardState extends State<LoyaltyCard> {
  int stampsCollected = 1; // Track stamps collected

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BarbershopHeader(),
        const SizedBox(height: 20),
        const LoyaltyCardTitle(),
        const SizedBox(height: 20),
        StampRow(stampsCollected: stampsCollected), // Pass stampsCollected
        const SizedBox(height: 20),
        QRScanButton(onQRScanned: (result) {
          setState(() {
            stampsCollected++; // Increment stamps if scan is successful
            // Here you can also add logic to validate the QR code content if needed
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('QR Code scanned: $result')),
            );
          });
        }),
      ],
    );
  }
}
