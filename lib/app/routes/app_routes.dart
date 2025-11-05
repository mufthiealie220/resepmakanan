import 'package:get/get.dart';
import '../modules/home_page.dart';
import '../modules/about_page.dart';
import '../modules/contact_page.dart';
import '../modules/detail_page.dart';
import '../modules/tips_page.dart';

class AppRoutes {
  static const home = '/home';
  static const about = '/about';
  static const contact = '/contact';
  static const detail = '/detail';
  static const tips = '/tips';

  static final routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: about, page: () => const AboutPage()),
    GetPage(name: contact, page: () => const ContactPage()),
    GetPage(name: detail, page: () => const DetailPage()),
    GetPage(name: tips, page: () => const TipsPage()),
  ];
}
