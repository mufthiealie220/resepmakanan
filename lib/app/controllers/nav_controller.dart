import 'package:get/get.dart';

class NavController extends GetxController {
  var currentRoute = '/home'.obs;

  void navigateTo(String route) {
    if (currentRoute.value == route) return;
    currentRoute.value = route;
    Get.toNamed(route);
  }
}
