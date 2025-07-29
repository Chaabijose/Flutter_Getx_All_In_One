import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../../../shared/widgets/custom_button.dart';

// Define the LoginPage widget which extends GetView for LoginController binding
class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      // Rebuild the UI when the controller updates
      builder: (_) => Material(
        child: Container(
          // Set gradient background for the login screen
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade400, Colors.blue.shade700],
            ),
          ),
          child: SafeArea(
            // Apply padding and build the main layout
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLogo(), // Logo and welcome text
                  SizedBox(height: 48),
                  _buildLoginForm(), // Login form with fields and button
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget to display the logo and welcome message
  Widget _buildLogo() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
            ],
          ),
          child: Icon(
            Icons.lock_outline,
            size: 50,
            color: Colors.blue.shade700,
          ),
        ),
        SizedBox(height: 24),
        Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Sign in to continue',
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ],
    );
  }

  // Widget to build the complete login form card
  Widget _buildLoginForm() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
        ],
      ),
      child: Column(
        children: [
          _buildEmailField(), // Email input
          SizedBox(height: 16),
          _buildPasswordField(), // Password input with visibility toggle
          SizedBox(height: 8),
          _buildErrorMessage(), // Reactive error message
          SizedBox(height: 24),
          _buildLoginButton(), // Sign-in button
          SizedBox(height: 16),
        ],
      ),
    );
  }

  // Widget for the email input field
  Widget _buildEmailField() {
    return TextFormField(
      controller: controller.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue.shade700),
        ),
      ),
    );
  }

  // Widget for the password input field with visibility toggle
  Widget _buildPasswordField() {
    return Obx(
      () => TextFormField(
        controller: controller.passwordController,
        obscureText:
            !controller.isPasswordVisible.value, // Hide or show password
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock_outlined),
          suffixIcon: IconButton(
            icon: Icon(
              controller.isPasswordVisible.value
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
            onPressed: controller.togglePasswordVisibility, // Toggle visibility
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade700),
          ),
        ),
      ),
    );
  }

  // Widget to show error message when login fails or input is invalid
  Widget _buildErrorMessage() {
    return Obx(
      () => controller.errorMessage.value.isNotEmpty
          ? Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                controller.errorMessage.value,
                style: TextStyle(color: Colors.red, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            )
          : SizedBox.shrink(), // Show nothing if no error
    );
  }

  // Widget for the login button with loading indicator
  Widget _buildLoginButton() {
    return Obx(
      () => CustomButton(
        text: 'Sign In',
        onPressed: controller.isLoading.value ? null : controller.login,
        isLoading: controller.isLoading.value,
        width: double.infinity,
      ),
    );
  }
}
