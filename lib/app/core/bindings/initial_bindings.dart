import 'package:get/get.dart';
import '../services/storage_service.dart';
import '../services/user_service.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<StorageService>(StorageService(), permanent: true);
    Get.put<UserService>(UserService(), permanent: true);
  }
}
