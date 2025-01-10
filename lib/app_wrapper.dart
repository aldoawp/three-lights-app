import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tlb_app/my_app.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  // int selectedIndex = 0;
  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // SafeArea(
          //   child:
          //     SizedBox(
          //   width: double.infinity,
          //   height: double.infinity,
          //   child: widget.navigationShell,
          // ),
          navigationShell,
      // ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          backgroundColor: ColorResource.bgLightGreen,
          indicatorColor: ColorResource.bgNormalGreen,
          overlayColor: WidgetStatePropertyAll(ColorResource.bgNormalGreen),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              label: StringResource.reservation,
            ),
            NavigationDestination(
              icon: Icon(Icons.cut_outlined),
              label: StringResource.catalogue,
            ),
            NavigationDestination(
              icon: Icon(Icons.star_outline),
              label: StringResource.loyalty,
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: StringResource.profile,
            ),
            NavigationDestination(
              icon: Icon(Icons.developer_mode_rounded),
              label: StringResource.about,
            ),
          ],
          onDestinationSelected: _goBranch),
    );
  }
}
