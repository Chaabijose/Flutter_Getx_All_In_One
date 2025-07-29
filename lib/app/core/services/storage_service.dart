// Import the GetX package for state management and dependency injection
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  // Create an instance of GetStorage to access local storage
  final GetStorage _box = GetStorage();

  // Keys used to store and retrieve data from local storage
  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _keyUserData = 'user_data';
  static const String _keyAuthToken = 'auth_token';

  // Getter to check if the user is logged in, defaults to false if null
  bool get isLoggedIn => _box.read(_keyIsLoggedIn) ?? false;

  // Getter to retrieve stored user data (as a Map)
  Map<String, dynamic>? get userData => _box.read(_keyUserData);

  // Getter to retrieve the stored authentication token
  String? get authToken => _box.read(_keyAuthToken);

  // Method to save login data to local storage
  Future<void> saveLoginData({
    required Map<String, dynamic> userData, // User data to store
    required String token, // Auth token to store
  }) async {
    // Write login status
    await _box.write(_keyIsLoggedIn, true);

    // Write user data
    await _box.write(_keyUserData, userData);

    // Write auth token
    await _box.write(_keyAuthToken, token);
  }

  // Method to clear all login-related data from local storage
  Future<void> clearLoginData() async {
    await _box.remove(_keyIsLoggedIn); // Remove login status
    await _box.remove(_keyUserData); // Remove user data
    await _box.remove(_keyAuthToken); // Remove auth token
  }

  // Method to update user data in local storage
  Future<void> updateUserData(Map<String, dynamic> userData) async {
    await _box.write(_keyUserData, userData); // Overwrite user data
  }
}
