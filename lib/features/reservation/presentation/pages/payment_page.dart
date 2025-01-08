import 'package:flutter/material.dart';
import 'package:tlb_app/features/reservation/domain/repositories/booking_repository.dart';
import 'package:tlb_app/features/reservation/presentation/pages/reservation_page.dart';
import 'package:tlb_app/injection_container.dart';
import 'package:tlb_app/my_app.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late final WebViewController _controller;
  String? _paymentToken;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPaymentToken();
  }

  Future<void> _fetchPaymentToken() async {
    try {
      // Mendapatkan token dari BookingRepository melalui service locator
      // ignore: await_only_futures
      final token = await sl<BookingRepository>().getPaymentToken ?? '';
      setState(() {
        _paymentToken = token;
        _isLoading = false;
      });
    } catch (e) {
      // Menangani error saat mengambil token
      setState(() {
        _isLoading = false;
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error getting payment token: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pembayaran'),
          backgroundColor: Colors.green,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_paymentToken == null || _paymentToken!.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pembayaran'),
          backgroundColor: ColorResource.primary,
        ),
        body: const Center(
          child: Text('Failed to load payment page.'),
        ),
      );
    }

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            debugPrint("URL started loading: $url");
            if (url.contains("finish") || url.contains("status_code=200")) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReservationPage(),
                ),
              );
            } else if (url.contains("example.com")) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Payment completed successfully.")),
              );
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(
        "https://app.sandbox.midtrans.com/snap/v2/vtweb/$_paymentToken",
      ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        backgroundColor: Colors.green,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
