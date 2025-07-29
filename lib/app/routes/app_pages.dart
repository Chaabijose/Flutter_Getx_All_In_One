import 'package:get/get.dart';
import 'package:getx_app/app/modules/home/views/home_page.dart';
import '../core/services/user_service.dart';
import '../features/auth/bindings/login_binding.dart';
import '../features/auth/pages/login_page.dart';
import '../modules/home/bindings/home_binding.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

  static String get initialRoute {
    final userService = Get.find<UserService>();
    return userService.isLoggedIn ? Routes.home : Routes.login;
  }

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(name: Routes.home, page: () => HomeView(), binding: HomeBinding()),
  ];
}
