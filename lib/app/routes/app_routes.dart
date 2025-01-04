import 'package:get/get.dart';
import 'package:final_tpc_app/app/ui/pages/push_notification/push_notification.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: '/push-page', page: () => PushHomePage()),
    // Add more routes as needed
  ];
}
