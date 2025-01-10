import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tlb_app/app_wrapper.dart';
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
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        toolbarHeight: 80,
        flexibleSpace: Container(
          color: ColorResource.primary,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              children: [
                Text(
                  StringResource.introAskAI,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 12),
                AskAiForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
