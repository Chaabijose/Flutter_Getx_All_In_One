import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/core/bindings/initial_bindings.dart';
import 'app/routes/app_pages.dart';

void main() async {
  // Ensure Flutter bindings are initialized before calling any plugins
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local storage using GetStorage
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Set the title of the application
      title: 'Auth Example',

      // Set the initial bindings (dependency injection) to load at app startup
      initialBinding: InitialBindings(),

      // Set the initial route of the app
      initialRoute: AppPages.initial,

      // Provide the list of pages/routes used in the app
      getPages: AppPages.routes,

      // Disable the debug banner in the top right corner
      debugShowCheckedModeBanner: false,

      // Define the app theme
      theme: ThemeData(
        // Set the primary color swatch to blue
        primarySwatch: Colors.blue,

        // Adjust the visual density for different platforms (mobile, desktop, etc.)
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
