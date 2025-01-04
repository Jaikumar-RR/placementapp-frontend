// lib/app/bindings/initial_binding.dart

import 'package:final_tpc_app/app/controllers/splash_screen_controller.dart';
import 'package:get/get.dart';
import 'package:final_tpc_app/app/services/firebase_analytics_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());

    // Initialize Firebase Analytics service
    Get.put(FirebaseAnalyticsService());
  }
}
