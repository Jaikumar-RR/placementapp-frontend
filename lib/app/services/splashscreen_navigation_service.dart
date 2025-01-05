import 'package:final_tpc_app/app/data/models/user_model.dart';
import 'package:final_tpc_app/app/data/models/user_role_model.dart';
import 'package:final_tpc_app/app/ui/pages/admin_pages/drawer/admin_drawer.dart';
import 'package:final_tpc_app/app/ui/pages/staff_pages/drawer/staff_drawer.dart';
import 'package:final_tpc_app/app/ui/pages/student_pages/drawer/student_drawer_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "../ui/pages/homepage/homepage.dart";
import '../data/models/admin_model.dart';
import '../data/models/staff_model.dart';
import '../data/models/student_model.dart';

class NavigationService {
  static void navigateToHomeScreen(User? user) {
    if (user == null) {
      Get.off(() => HomePage());
    }

    UserRole role = user!.role;

    switch (role) {
      case UserRole.student:
        Get.off(() => StudentDrawerHome(student: user.student!));
        break;
      case UserRole.staff:
        Get.off(() => StaffDrawerHome(staff: user.staff!));
        break;
      case UserRole.admin:
        Get.off(() => AdminDrawerHome(admin: user.admin!));
        break;
    }
  }
}
