import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/user_service.dart';
import '../../../routes/app_routes.dart';

// Define the LoginController using GetX
class LoginController extends GetxController {
  // Access the user service using dependency injection
  final UserService _userService = Get.find<UserService>();

  // Controllers for email and password input fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Reactive boolean for loading indicator
  final RxBool isLoading = false.obs;

  // Reactive boolean to toggle password visibility
  final RxBool isPasswordVisible = false.obs;

  // Reactive string to store error messages
  final RxString errorMessage = ''.obs;

  // Called when the controller is destroyed
  @override
  void onClose() {
    // Dispose text controllers to free resources
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Toggle the visibility of the password input field
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Attempt to log the user in
  Future<void> login() async {
    // Validate input fields
    if (!_validateInputs()) return;

    // Start loading and clear error message
    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Attempt to log in using the UserService
      final success = await _userService.login(
        emailController.text.trim(), // Trimmed email
        passwordController.text, // Raw password
      );

      if (success) {
        // Navigate to home page and clear navigation history
        Get.offAllNamed(Routes.home);
      } else {
        // Show login error message
        errorMessage.value = 'Invalid email or password';
      }
    } catch (e) {
      // Show a generic error if an exception occurs
      errorMessage.value = 'Login failed. Please try again.';
    } finally {
      // Stop the loading spinner
      isLoading.value = false;
    }
  }

  // Validate the user inputs before attempting login
  bool _validateInputs() {
    // Check if email is empty
    if (emailController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter your email';
      return false;
    }

    // Check if the email format is valid
    if (!GetUtils.isEmail(emailController.text.trim())) {
      errorMessage.value = 'Please enter a valid email';
      return false;
    }

    // Check if password is empty
    if (passwordController.text.isEmpty) {
      errorMessage.value = 'Please enter your password';
      return false;
    }

    // Check if password is at least 6 characters long
    if (passwordController.text.length < 6) {
      errorMessage.value = 'Password must be at least 6 characters';
      return false;
    }

    // If all validations pass, return true
    return true;
  }
}
