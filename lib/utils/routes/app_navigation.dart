import 'package:favin_test/feature/home/home_screen.dart';
import 'package:get/get.dart';

class AppRouts {
  static const String home = '/home_screen';
}

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRouts.home,
      page: () => const HomeScreen(),
    ),
  ];
}
