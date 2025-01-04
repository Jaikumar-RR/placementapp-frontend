// department_controller.dart

import 'package:final_tpc_app/app/data/models/department_model.dart';
import 'package:get/get.dart';
import 'package:final_tpc_app/app/data/api/student_requests.dart';
import 'package:final_tpc_app/app/data/models/student_model.dart';

class DepartmentController extends GetxController {
  RxList<Map<String, String>> departments = <Map<String, String>>[].obs;
  RxBool isLoaded = false.obs;
  RxString searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  Future<void> initializeData() async {
    const String queryParam = "allDepartment=true";
    try {
      List<Student> willingStudents =
          await StudentRequests.getStudentsByPlacementWilling("yes");

      List<Department> studentDepartments =
          willingStudents.map((student) => student.department!).toSet().toList();

      departments.value = studentDepartments
          .map((dept) => {
                'name': dept.name ?? 'Unknown Department',
                'image': dept., // Dummy image
              })
          .toList();

      isLoaded.value = true;
    } catch (e) {
      print("Error fetching departments: $e");
      isLoaded.value = true;
    }
  }

  void filterDepartmentsBySearch(String query) {
    searchText.value = query;
  }

  List<Map<String, String>> getFilteredDepartments() {
    if (searchText.isEmpty) {
      return departments;
    } else {
      return departments
          .where((dept) =>
              dept['name']!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }
}
