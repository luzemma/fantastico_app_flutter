import 'package:fantastico_app/ui/app/widgets/bottom_nav_bar_item.dart';
import 'package:fantastico_app/utils/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(
          key: key ?? const ValueKey<String>('ScaffoldWithNavBar'),
        );

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: ColorHelper.primaryBlue,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: ColorHelper.lightGray,
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: BottomNavBarItem(Icons.menu_book),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: BottomNavBarItem(Icons.barcode_reader),
            label: 'Escaner',
          ),
          BottomNavigationBarItem(
            icon: BottomNavBarItem(Icons.search),
            label: 'Búsqueda',
          ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
