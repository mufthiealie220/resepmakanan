import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_controller.dart';

class CustomDrawer extends StatelessWidget {
  final NavController navController = Get.find<NavController>();
  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Text(
              'Menu Aplikasi',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              navController.navigateTo('/home');
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.tips_and_updates),
            title: const Text('Tips'),
            onTap: () {
              navController.navigateTo('/tips');
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Tentang Chef'),
            onTap: () {
              navController.navigateTo('/about');
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Kontak'),
            onTap: () {
              navController.navigateTo('/contact');
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
