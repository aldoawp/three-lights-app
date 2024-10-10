import 'package:flutter/material.dart';
import 'package:tlb_app/main.dart';

class OnboardingContent extends StatelessWidget {
  final String headlineColored;
  final String headlineNonColored;
  final String description;

  const OnboardingContent({
    super.key,
    required this.headlineColored,
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
              style: TextStyleResource.heading_xl
                  .copyWith(color: ColorResource.primary)),
          TextSpan(
              text: headlineNonColored, style: TextStyleResource.heading_xl),
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
          style: TextStyleResource.body_base,
        ),
      ],
    );
  }
}
