import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../../../modules/auth/bindings/auth_binding.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Ensure AuthController is available
    AuthBinding().dependencies();
    Get.put<LoginController>(LoginController());
  }
}
