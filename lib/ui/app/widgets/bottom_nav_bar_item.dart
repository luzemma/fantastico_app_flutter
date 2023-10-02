import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem(
    this.icon, {
    super.key,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Icon(
        icon,
        size: 20,
      ),
    );
  }
}
