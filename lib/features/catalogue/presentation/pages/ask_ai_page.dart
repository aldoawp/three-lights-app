import 'package:flutter/material.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/ask_ai_form.dart';
import 'package:tlb_app/my_app.dart';

class AskAiPage extends StatelessWidget {
  const AskAiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tanya AI',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        toolbarHeight: 80,
        flexibleSpace: Container(
          color: ColorResource.primary,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              StringResource.introAskAI,
              style: TextStyle(fontSize: 14),
            ),
            AskAiForm(),
          ],
        ),
      ),
    );
  }
}
