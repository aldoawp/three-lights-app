import 'package:flutter/material.dart';

class AiResult extends StatelessWidget {
  final String result;

  const AiResult({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (result.isEmpty) {
      return Center(
        child: Text(
          'Tidak ada hasil untuk ditampilkan.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return Text(
      result,
      style: TextStyle(fontSize: 16),
    );
  }
}
