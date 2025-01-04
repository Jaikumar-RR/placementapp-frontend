import 'staff_model.dart';
import 'student_model.dart';

class Department {
  final int deptId;
  final String name;
  final String? description;
  final String? logo;
  final List<Student> students;
  final List<Staff> staff;

  Department({
    required this.deptId,
    required this.name,
    this.description,
    this.logo,
    required this.students,
    required this.staff,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      deptId: json['dept_id'],
      name: json['name'],
      description: json['description'],
      logo: json['logo'],
      students:
          List<Student>.from(json['students'].map((x) => Student.fromJson(x))),
      staff: List<Staff>.from(json['staff'].map((x) => Staff.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dept_id': deptId,
      'name': name,
      'description': description,
      'students': List<dynamic>.from(students.map((x) => x.toJson())),
      'staff': List<dynamic>.from(staff.map((x) => x.toJson())),
    };
  }
}
