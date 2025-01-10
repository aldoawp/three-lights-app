import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tlb_app/my_app.dart'; // Import mobile_scanner

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mobile Scanner',
          style: TextStyle(color: ColorResource.offWhite),
        ),
        backgroundColor: ColorResource.primary,
        iconTheme: const IconThemeData(
          // Add this
          color: ColorResource.offWhite, // Set the color here
        ),
      ),
      body: MobileScanner(
        controller: cameraController,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            debugPrint('Barcode found! ${barcode.rawValue}');
            GoRouter.of(context)
                .pop(barcode.rawValue); // Use GoRouter.of(context).pop()
          }
        },
      ),
    );
  }
}
