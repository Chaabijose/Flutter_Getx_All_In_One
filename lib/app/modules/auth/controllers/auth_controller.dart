import 'package:get/get.dart';
import 'package:getx_app/app/data/models/user_model.dart';
import '../../../core/services/user_service.dart';
import '../../../routes/app_routes.dart';

// AuthController handles login, logout, registration, and authentication state
class AuthController extends GetxController {
  // Access the user service via dependency injection
  final UserService _userService = Get.find<UserService>();

  // Reactive loading flag to show spinners
  final RxBool isLoading = false.obs;

  // Reactive error message for displaying login/register errors
  final RxString errorMessage = ''.obs;

  // Getter to check login status
  bool get isLoggedIn => _userService.isLoggedIn;

  // Getter to access the current logged-in user
  UserModel? get currentUser => _userService.currentUser;

  // Called automatically when controller is initialized
  @override
  void onInit() {
    super.onInit();
    _checkAuthStatus(); // Setup auth state listener
  }

  // Listen to login state and redirect user accordingly
  void _checkAuthStatus() {
    // Reactively monitor login status and navigate
    ever(_userService.isLoggedInRx, (bool isLoggedIn) {
      if (isLoggedIn) {
        // Navigate to home if logged in
        Get.offAllNamed(Routes.home);
      } else {
        // Navigate to login if not logged in
        Get.offAllNamed(Routes.login);
      }
    });
  }

  // Handle login logic
  Future<bool> login(String email, String password) async {
    // Validate input fields
    if (!_validateLoginInputs(email, password)) return false;

    // Start loading and clear error
    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Attempt to login via user service
      final success = await _userService.login(email, password);

      // If login fails, show error
      if (!success) {
        errorMessage.value = 'Invalid email or password';
      }

      return success;
    } catch (e) {
      // Handle login exception
      errorMessage.value = 'Login failed. Please try again.';
      return false;
    } finally {
      // Stop loading spinner
      isLoading.value = false;
    }
  }

  // Handle logout logic
  Future<void> logout() async {
    isLoading.value = true;

    try {
      await _userService.logout(); // Call logout from user service
    } finally {
      isLoading.value = false;
    }
  }

  // Handle user registration
  Future<bool> register(String name, String email, String password) async {
    // Validate inputs
    if (!_validateRegisterInputs(name, email, password)) return false;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Simulate registration API delay
      await Future.delayed(Duration(seconds: 2));

      // Auto login after registration (demo behavior)
      return await login(email, password);
    } catch (e) {
      // Handle exception
      errorMessage.value = 'Registration failed. Please try again.';
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Validate login inputs
  bool _validateLoginInputs(String email, String password) {
    if (email.trim().isEmpty) {
      errorMessage.value = 'Please enter your email';
      return false;
    }

    if (!GetUtils.isEmail(email.trim())) {
      errorMessage.value = 'Please enter a valid email';
      return false;
    }

    if (password.isEmpty) {
      errorMessage.value = 'Please enter your password';
      return false;
    }

    if (password.length < 6) {
      errorMessage.value = 'Password must be at least 6 characters';
      return false;
    }

    return true;
  }

  // Validate registration inputs (calls login validation too)
  bool _validateRegisterInputs(String name, String email, String password) {
    if (name.trim().isEmpty) {
      errorMessage.value = 'Please enter your name';
      return false;
    }

    // Validate email and password using existing method
    return _validateLoginInputs(email, password);
  }

  // Clear the error message
  void clearError() {
    errorMessage.value = '';
  }
}
