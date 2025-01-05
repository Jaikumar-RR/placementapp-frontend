// To parse this JSON data, do
//
//     final registerStaff = registerStaffFromJson(jsonString);

import 'dart:convert';

RegisterStaff registerStaffFromJson(String str) =>
    RegisterStaff.fromJson(json.decode(str));

String registerStaffToJson(RegisterStaff data) => json.encode(data.toJson());

class RegisterStaff {
  String password;
  String email;
  String name;
  String role;
  String username;
  int deptId;
  String phoneNumber;
  String profileUrl;

  RegisterStaff({
    required this.password,
    required this.email,
    required this.name,
    required this.role,
    required this.username,
    required this.deptId,
    required this.phoneNumber,
    required this.profileUrl,
  });

  factory RegisterStaff.fromJson(Map<String, dynamic> json) => RegisterStaff(
        password: json["password"],
        email: json["email"],
        name: json["name"],
        role: json["role"],
        username: json["username"],
        deptId: json["dept_id"],
        phoneNumber: json["phone_number"],
        profileUrl: json["profile_url"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "email": email,
        "name": name,
        "role": role,
        "username": username,
        "dept_id": deptId,
        "phone_number": phoneNumber,
        "profile_url": profileUrl,
      };
}
