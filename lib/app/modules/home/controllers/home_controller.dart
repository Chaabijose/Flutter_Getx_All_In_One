import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/user_service.dart';
import '../../../routes/app_routes.dart';

// Define HomeController using GetX for the Home screen
class HomeController extends GetxController {
  // Retrieve an instance of UserService via dependency injection
  final UserService _userService = Get.find<UserService>();

  // Get the current user's name or use a default fallback
  String get userName => _userService.currentUser?.name ?? 'User';

  // Get the current user's email or return an empty string
  String get userEmail => _userService.currentUser?.email ?? '';

  // Get the current user's avatar URL, can be null
  String? get userAvatar => _userService.currentUser?.avatar;

  // Logout function with confirmation dialog
  Future<void> logout() async {
    // Show a confirmation dialog using Get.dialog
    Get.dialog(
      AlertDialog(
        title: Text('Logout'), // Dialog title
        content: Text('Are you sure you want to logout?'), // Message
        actions: [
          // Cancel button closes the dialog
          TextButton(onPressed: () => Get.back(), child: Text('Cancel')),

          // Logout button triggers logout process
          TextButton(
            onPressed: () async {
              Get.back(); // Close the dialog first
              await _userService.logout(); // Clear user data
              Get.offAllNamed(Routes.login); // Navigate to login screen
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
