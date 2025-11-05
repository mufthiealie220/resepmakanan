import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/controllers/nav_controller.dart';
import 'app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller agar Get.find() bisa dipakai di semua widget
    Get.put(NavController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resep Makanan Tradisional',
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
    );
  }
}
