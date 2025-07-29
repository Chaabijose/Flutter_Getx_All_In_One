import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../modules/auth/controllers/auth_controller.dart';

// Define the LoginController using GetX
class LoginController extends GetxController {
  // Access the AuthController using dependency injection
  final AuthController _authController = Get.find<AuthController>();

  // Text controllers to handle user input from text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Reactive boolean to control password visibility
  final RxBool isPasswordVisible = false.obs;

  // Getter to access loading state from AuthController
  bool get isLoading => _authController.isLoading.value;

  // Getter to access error messages from AuthController
  String get errorMessage => _authController.errorMessage.value;

  // Called when this controller is disposed
  @override
  void onClose() {
    // Dispose of the text controllers to prevent memory leaks
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Toggle the visibility of the password field
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Delegate login action to the AuthController
  Future<void> login() async {
    await _authController.login(
      emailController.text.trim(), // Trim whitespace from email
      passwordController.text, // Use entered password
    );
  }

  // Clear any error messages via AuthController
  void clearError() {
    _authController.clearError();
  }
}
