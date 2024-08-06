import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart'; // Import BottomNavBar
import 'drawer_widget.dart'; // Import AppDrawer

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A2C2D),
        centerTitle: true,
        title: const Text(
          'Favorite',
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
          'Favorite Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
        onTap: (index) => handleNavigation(context, index),
      ),
    );
  }
}
