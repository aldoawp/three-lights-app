import 'package:flutter/material.dart';
import 'package:tlb_app/my_app.dart';

class OnboardingContent extends StatelessWidget {
  final String? headlineColored;
  final String headlineNonColored;
  final String description;

  const OnboardingContent({
    super.key,
    this.headlineColored,
    required this.headlineNonColored,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: headlineColored,
              style: TextStyleResource.headingXL
                  .copyWith(color: ColorResource.primary)),
          TextSpan(
              text: headlineNonColored, style: TextStyleResource.headingXL),
        ])),
        const SizedBox(height: 24.0),
        Container(
          color: ColorResource.text,
          height: 1,
          width: 60,
        ),
        const SizedBox(height: 24.0),
        Text(
          description,
          style: TextStyleResource.bodyBase,
        ),
      ],
    );
  }
}
