import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_controller.dart';

class CustomBottomNav extends StatelessWidget {
  final NavController navController = Get.find<NavController>();
  CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: _getCurrentIndex(navController.currentRoute.value),
        onTap: (index) {
          final route = _getRouteFromIndex(index);
          navController.navigateTo(route);
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.tips_and_updates), label: 'Tips'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Chef'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'Kontak'),
        ],
      );
    });
  }

  int _getCurrentIndex(String route) {
    switch (route) {
      case '/tips':
        return 1;
      case '/about':
        return 2;
      case '/contact':
        return 3;
      default:
        return 0;
    }
  }

  String _getRouteFromIndex(int index) {
    switch (index) {
      case 1:
        return '/tips';
      case 2:
        return '/about';
      case 3:
        return '/contact';
      default:
        return '/home';
    }
  }
}
