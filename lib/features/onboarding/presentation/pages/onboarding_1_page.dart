import 'package:flutter/material.dart';
import 'package:tlb_app/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: ColorResource.bgWhite,
        constraints: constraints,
        child: Column(
          children: [
            Image(
              image: const AssetImage(ImageResource.onboardBg1),
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    StringResource.onboardHeadline1,
                    style: TextStyleResource.heading_xl,
                  ),
                  Text(
                    StringResource.onboardDesc1,
                    style: TextStyleResource.body_base,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }));
  }
}
