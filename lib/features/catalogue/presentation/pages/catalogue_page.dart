import 'package:flutter/material.dart';
import 'package:tlb_app/constants/navigations/navigation_index.dart';
import 'package:tlb_app/my_app.dart';
import 'package:tlb_app/global_widget.dart';

class CataloguePage extends StatelessWidget {
  const CataloguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue Page"),
        
      ),
      bottomNavigationBar: NavBar(
        currentIndex: cataloguePageIndex,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Main Content"),
          ],
        ),
      ),
    );
  }
}
