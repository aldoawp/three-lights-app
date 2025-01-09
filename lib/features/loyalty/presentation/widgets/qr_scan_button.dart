import 'package:flutter/material.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/qr_scanner_screen.dart';

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
        backgroundColor: const Color(0xFF4CAF50), // Green background
        foregroundColor: Colors.white, // White text
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('Pindai Kode QR'),
          SizedBox(width: 8),
          Icon(
            Icons.qr_code,
            size: 20,
          ),
        ],
      ),
    );
  }
}
