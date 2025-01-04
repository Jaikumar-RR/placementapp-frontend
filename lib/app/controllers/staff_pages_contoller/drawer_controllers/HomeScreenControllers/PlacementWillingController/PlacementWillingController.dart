import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Define the Student model
class Student {
  final String name;
  final String rollno;
  final String cgpa;
  final String imageUrl;
  final String section;

  Student({
    required this.name,
    required this.rollno,
    required this.cgpa,
    required this.imageUrl,
    required this.section,
  });
}

// Controller for managing placement willing students
class PlacementwillingController extends GetxController {
  var isLoading = true.obs;
  var students = <Student>[].obs;
  var filteredStudents = <Student>[].obs; // For filtering students
  var sections = <String>[].obs; // List of sections
  var selectedSection = ''.obs; // Currently selected section

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  void fetchStudents() async {
    await Future.delayed(const Duration(seconds: 3)); // Simulate loading
    students.value = [
      Student(
        imageUrl:
            'https://pbywhmrgjtkosnsdunvc.supabase.co/storage/v1/object/public/sit-tpc/company-logo/zoho.jpg',
        name: 'Maheshesri',
        rollno: '21CD056',
        cgpa: '9.0',
        section: 'A',
      ),
      Student(
        imageUrl:
            'https://static.hbo.com/content/dam/hbodata/series/game-of-thrones/character/s5/daenarys-1920.jpg?w=1200',
        name: 'Gajendhri',
        rollno: '21CD014',
        cgpa: '9.5',
        section: 'B',
      ),
    ];
    isLoading.value = false;

    // Populate sections dynamically
    sections.value =
        students.map((student) => student.section).toSet().toList();
    filteredStudents.value = students; // Initially, display all students
  }

  void filterStudentsByName(String query) {
    if (query.isEmpty) {
      filteredStudents.value = students;
    } else {
      filteredStudents.value = students
          .where((student) =>
              student.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void filterStudentsBySection(String? section) {
    selectedSection.value = section ?? '';
    if (section == null || section.isEmpty) {
      filteredStudents.value = students;
    } else {
      filteredStudents.value =
          students.where((student) => student.section == section).toList();
    }
  }

  void resetFilters() {
    selectedSection.value = '';
    filteredStudents.value = students; // Reset to show all students
  }

  void openFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filter Options',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Obx(() {
                return DropdownButton<String>(
                  value: selectedSection.value.isEmpty
                      ? null
                      : selectedSection.value,
                  hint: Text("Select Section"),
                  items: sections.map((section) {
                    return DropdownMenuItem<String>(
                      value: section,
                      child: Text(section),
                    );
                  }).toList(),
                  onChanged: (value) {
                    filterStudentsBySection(value);
                    Navigator.pop(context); // Close the filter modal
                  },
                  isExpanded: true,
                );
              }),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  resetFilters(); // Reset filters
                  Navigator.pop(context); // Close the filter modal
                },
                child: Text('Reset Filters'),
              ),
            ],
          ),
        );
      },
    );
  }
}
