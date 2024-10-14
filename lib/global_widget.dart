import 'package:flutter/material.dart';
import 'my_app.dart';

// Navigation Bar
class NavBar extends StatefulWidget {
  int currentIndex;

  NavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: widget.currentIndex,
      backgroundColor: ColorResource.bgLightGreen,
      indicatorColor: ColorResource.bgNormalGreen,
      overlayColor: WidgetStatePropertyAll(ColorResource.bgNormalGreen),
      destinations: <Widget>[
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
      ],
      onDestinationSelected: (int index) {
        widget.currentIndex = index;
        switch (widget.currentIndex) {
          case 0:
            Navigator.pushReplacementNamed(
                context, Routes.reservationPage.name);
            break;
          case 1:
            Navigator.pushReplacementNamed(context, Routes.cataloguePage.name);
            break;
          case 2:
            Navigator.pushReplacementNamed(context, Routes.loyaltyPage.name);
            break;
          case 3:
            Navigator.pushReplacementNamed(context, Routes.profilePage.name);
            break;
        }
      },
    );
  }
}
