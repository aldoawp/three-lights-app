import 'package:flutter/material.dart';
import 'package:tlb_app/my_app.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: StringResource.onboardOneHeadlineColored,
                      style: TextStyleResource.headingXL
                          .copyWith(color: ColorResource.primary)),
                  const TextSpan(
                      text: StringResource.onboardOneHeadlineNonColored,
                      style: TextStyleResource.headingXL),
                ])),
                const SizedBox(height: 24.0),
                Container(
                  color: ColorResource.text,
                  height: 1,
                  width: 60,
                ),
                const SizedBox(height: 24.0),
                const Text(
                  StringResource.onboardDesc1,
                  style: TextStyleResource.bodyBase,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: FilledButton(
                onPressed: () {},
                style: const ButtonStyle(
                    iconSize: WidgetStatePropertyAll(24),
                    textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
                    minimumSize: WidgetStatePropertyAll(Size(0, 70)),
                    backgroundColor: WidgetStatePropertyAll(Color(0xFF588B78)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Lanjut"),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
