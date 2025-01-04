import 'department_model.dart';
import 'user_model.dart';

class Staff {
  final int staffId;
  final int userId;
  final String? staffRollno;
  final String name;
  final int deptId;
  final String? phoneNumber;
  final String? email;
  final String? profile_url;
  final DateTime createdAt;
  final Department department;
  final User user;

  Staff({
    required this.staffId,
    required this.userId,
    required this.name,
    this.staffRollno,
    required this.deptId,
    this.phoneNumber,
    this.email,
    this.profile_url,
    required this.createdAt,
    required this.department,
    required this.user,
  });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      staffId: json['staff_id'],
      userId: json['user_id'],
      name: json['name'],
      staffRollno: json['staff_rollno'],
      deptId: json['dept_id'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      createdAt: DateTime.parse(json['created_at']),
      department: Department.fromJson(json['department']),
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'staff_id': staffId,
      'user_id': userId,
      'name': name,
      'staff_rollno': staffRollno,
      'dept_id': deptId,
      'phone_number': phoneNumber,
      'email': email,
      'created_at': createdAt.toIso8601String(),
      'department': department.toJson(),
      'user': user.toJson(),
    };
  }
}
