import 'package:get/get.dart';
import 'package:luck_ffle/app/views/bottom%20navigation/bottom_navigation.dart';

class AppPages {
  static const initial = Routes.splashscreen;

  static final routes = [
    GetPage(name: Routes.mainscreen, page: () => const MainScreen()),
  ];
}

class Routes {
  static const splashscreen = '/';

  static const mainscreen = '/mainscreen';
  static const details = '/details';
}
