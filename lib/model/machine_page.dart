import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart'; // Import BottomNavBar
import 'drawer_widget.dart'; // Import AppDrawer

class MachinePage extends StatelessWidget {
  const MachinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A2C2D),
        centerTitle: true,
        title: const Text(
          'Machine',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono',
          ),
        ),
      ),
      drawer: const AppDrawer(), // Add the drawer here
      body: const Center(
        child: Text(
          'Machine Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) => handleNavigation(context, index),
      ),
    );
  }
}
