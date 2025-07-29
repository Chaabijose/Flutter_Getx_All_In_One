import 'package:get/get.dart';
import 'package:getx_app/app/data/models/user_model.dart';
import 'storage_service.dart';

// Define a service to manage user-related logic (login, logout, session)
class UserService extends GetxService {
  // Get the StorageService instance using GetX dependency injection
  final StorageService _storageService = Get.find<StorageService>();

  // Reactive variable to hold the current user object
  final Rx<UserModel?> _currentUser = Rx<UserModel?>(null);

  // Reactive boolean to indicate login status
  final RxBool _isLoggedIn = false.obs;

  // Getter to access the current user
  UserModel? get currentUser => _currentUser.value;

  // Getter to access the login status
  bool get isLoggedIn => _isLoggedIn.value;

  // Getter to expose login status reactively
  RxBool get isLoggedInRx => _isLoggedIn;

  // Called when the service is initialized
  @override
  void onInit() {
    super.onInit();

    // Load user session info from local storage
    _loadUserFromStorage();
  }

  // Load the user data from local storage if already logged in
  void _loadUserFromStorage() {
    if (_storageService.isLoggedIn && _storageService.userData != null) {
      // Convert stored map data into UserModel and assign it
      _currentUser.value = UserModel.fromJson(_storageService.userData!);

      // Mark user as logged in
      _isLoggedIn.value = true;
    }
  }

  // Simulate login logic (normally you'd call an API here)
  Future<bool> login(String email, String password) async {
    try {
      // Simulate network delay
      await Future.delayed(Duration(seconds: 2));

      // Fake login credentials for demonstration
      if (email == 'admin@example.com' && password == 'password123') {
        final userData = {
          'id': '1',
          'email': email,
          'name': 'Admin User',
          'avatar': 'https://via.placeholder.com/150',
          'role': 'admin',
        };

        // Generate a mock token
        final token = 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}';

        // Save user and token to local storage
        await _storageService.saveLoginData(userData: userData, token: token);

        // Update current user and login state
        _currentUser.value = UserModel.fromJson(userData);
        _isLoggedIn.value = true;

        return true;
      }

      // Invalid credentials
      return false;
    } catch (e) {
      // Handle login exception
      print('Login error: $e');
      return false;
    }
  }

  // Clear login data and reset session
  Future<void> logout() async {
    await _storageService.clearLoginData(); // Clear storage
    _currentUser.value = null; // Reset user data
    _isLoggedIn.value = false; // Mark as logged out
  }

  // Update the user's profile and save changes to local storage
  Future<void> updateProfile(Map<String, dynamic> updates) async {
    if (_currentUser.value != null) {
      // Clone current user data to a new map
      final updatedData = _currentUser.value!.toJson();

      // Apply updates
      updatedData.addAll(updates);

      // Save to storage
      await _storageService.updateUserData(updatedData);

      // Update in-memory user model
      _currentUser.value = UserModel.fromJson(updatedData);
    }
  }
}
