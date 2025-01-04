import 'package:final_tpc_app/app/controllers/theme_controller/app_color_controller.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:final_tpc_app/app/ui/pages/splash_screen/splash_screen.dart';
import 'package:final_tpc_app/app/bindings/app_binding.dart';
import 'package:final_tpc_app/app/config/firebase_options.dart';
import 'package:final_tpc_app/app/routes/app_routes.dart';
import 'package:final_tpc_app/app/services/firebase_analytics_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase Initialization and Notification Service setup with error handling
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    debugPrint('Error initializing Firebase or NotificationService: $e');
  }

  // Dependency injection for ThemeController
  Get.put(ThemeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final ThemeController themeController = Get.find();
      // Set global status bar theme
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: themeController.primaryColor, // Status bar background
          statusBarIconBrightness: themeController.isDarkMode
              ? Brightness.light // Light icons for dark mode
              : Brightness.dark, // Dark icons for light mode
        ),
      );
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: AppBindings(),
        home: SplashScreen(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(
            analytics: FirebaseAnalyticsService.analytics,
          ),
        ],
        theme: ThemeData(
          primaryColor: themeController.primaryColor,
          hintColor: themeController.secondaryColor,
        ),
        darkTheme: ThemeData(
          primaryColor: themeController.primaryColor,
          hintColor: themeController.secondaryColor,
        ),
        themeMode: themeController.isDarkMode
            ? ThemeMode.dark
            : ThemeMode.light, // Toggle based on isDarkMode
        getPages: AppRoutes.pages, // Centralized route management
      );
    });
  }
}
