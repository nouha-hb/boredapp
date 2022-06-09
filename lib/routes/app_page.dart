import 'package:funapp/binding/home_binding.dart';
import 'package:funapp/screens/home_page.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
   GetPage(
      name: Routes.initial,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
       
  ];
}
