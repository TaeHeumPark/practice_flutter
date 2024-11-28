import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FramePage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const FramePage({super.key,required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer
        )
      ),
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          destinations: [
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
          onDestinationSelected: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
        ),
      ),
    );
  }
}