import 'package:flutter/material.dart';
part 'constants/text_style.dart';
part 'constants/color.dart';
part 'constants/image.dart';
part 'constants/string.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
