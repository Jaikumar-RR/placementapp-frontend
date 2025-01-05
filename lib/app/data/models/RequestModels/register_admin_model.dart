// To parse this JSON data, do
//
//     final registerAdmin = registerAdminFromJson(jsonString);

import 'dart:convert';

RegisterAdmin registerAdminFromJson(String str) =>
    RegisterAdmin.fromJson(json.decode(str));

String registerAdminToJson(RegisterAdmin data) => json.encode(data.toJson());

class RegisterAdmin {
  String password;
  String email;
  String username;
  String name;
  String role;
  String phoneNumber;
  String profileUrl;

  RegisterAdmin({
    required this.password,
    required this.email,
    required this.username,
    required this.name,
    required this.role,
    required this.phoneNumber,
    required this.profileUrl,
  });

  factory RegisterAdmin.fromJson(Map<String, dynamic> json) => RegisterAdmin(
        password: json["password"],
        email: json["email"],
        username: json["username"],
        name: json["name"],
        role: json["role"],
        phoneNumber: json["phone_number"],
        profileUrl: json["profile_url"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "email": email,
        "username": username,
        "name": name,
        "role": role,
        "phone_number": phoneNumber,
        "profile_url": profileUrl,
      };
}
