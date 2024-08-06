import 'package:flutter/material.dart';
import 'home_page.dart';
import 'report_page.dart';
import 'message_page.dart';
import 'favorite_page.dart';
import 'machine_page.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF2A2C2D), // Update background color here
      currentIndex: currentIndex,
      selectedItemColor: Colors.white, // Set selected item color
      unselectedItemColor: Colors.grey, // Set unselected item color
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Machine'),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Report'),
        BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Message'),
      ],
      onTap: onTap,
    );
  }
}

void handleNavigation(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      break;
    case 1:
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const MachinePage()));
      break;
    case 2:
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const FavoritePage()));
      break;
    case 3:
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ReportPage()));
      break;
    case 4:
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const MessagePage()));
      break;
    default:
      break;
  }
}
