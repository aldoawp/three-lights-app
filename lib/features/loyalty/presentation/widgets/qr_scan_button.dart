import 'package:flutter/material.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/qr_scanner_screen.dart';
import 'package:tlb_app/my_app.dart';

class QRScanButton extends StatelessWidget {
  final Function(String) onQRScanned;
  final VoidCallback onInvalidQR;

  const QRScanButton(
      {super.key, required this.onQRScanned, required this.onInvalidQR});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        var result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const QRScannerScreen()),
        );
        if (result != null) {
          onQRScanned(result as String);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            ColorResource.primary, // Example color, replace with your theme
        foregroundColor: Colors.white, // White text
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max, // Shrinks to fit content
        mainAxisAlignment:
            MainAxisAlignment.center, // Centers content in the Row
        children: const [
          Text(
            'Pindai Kode QR',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(width: 8),
          Icon(
            Icons.qr_code,
            size: 20,
            color: ColorResource.offWhite,
          ),
        ],
      ),
    );
  }
}
